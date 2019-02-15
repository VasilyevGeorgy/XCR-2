import pyaudio
import numpy as np
import time

import peakdetect
import customfirwin_ as fir
import savgol_filter as sgf


# Sound stream params
CHUNK = 1024  # samples per buffer
FORMAT = pyaudio.paInt16  # bytes per sample
CHANNELS = 1  # number of channels for micro
RATE = 8000 # Sampling frequency; 44100 Hz is default

pa = pyaudio.PyAudio()

stream = pa.open(
    format=FORMAT,
    channels=CHANNELS,
    rate=RATE,
    input=True,
    output=False,
    frames_per_buffer=CHUNK#,
    #input_device_index=2
)

nyq = RATE//2
ts = 1/RATE # Ts is period
M = 256  # number of taps in filter
fc = 0.4756  # from 100 to 4096 bandpass

ham_lp = fir.build_filter(M, fc, window=fir.hamming)
black_lp = fir.build_filter(M, fc, window=fir.blackman)
shift = (np.cos(2 * np.pi * 0.5 * np.arange(M + 1)))
ham_hp = ham_lp * shift
black_hp = black_lp * shift

while True:

    # Get binary data
    data = stream.read(CHUNK)
    time.sleep(0.05)
    data_int = np.frombuffer(data, dtype=np.int16) # Convert data from buffer to int
    data_np = [(i/(2**14)) for i in data_int] # 16 bits = 2^16; first bit for sign; 2^15/2: from -(2^14) to 2^14
    f_ham = np.convolve(data_np, ham_hp)
    f_black = np.convolve(data_np, black_hp)

    # FFT
    y_fft  = np.fft.fft(data_np)
    y_fft_ = np.fft.fft(fir.hamming(len(f_black))[:-1]*(f_black))
    gain_coeff = 1.8 # Gain for freqs values    1.5
    spec_data = np.abs(y_fft_[0:CHUNK] / CHUNK * 2)

    spec_data = sgf.savgolfilt(spec_data, 2, 5, 1)
    maxs, mins = peakdetect.peakdet(spec_data, 0.03)

    # Convert taps number in frequencies
    if (len(maxs) > 0):
        for i in range(len(maxs)):
            maxs[i][0] *= RATE/CHUNK*0.8
            #maxs[0:len(maxs)][0] *= RATE/CHUNK
        maxs = maxs[:len(maxs) // 2] # Get first part of vector

    if (len(maxs)>0):
        print(list(maxs))

