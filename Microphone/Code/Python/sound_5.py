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
    data = stream.read(CHUNK, exception_on_overflow = False)
    time.sleep(0.005)
    data_int = np.frombuffer(data, dtype=np.int16) # Convert data from buffer to int
    data_np = [(i/(2**14)) for i in data_int] # 16 bits = 2^16; first bit for sign; 2^15/2: from -(2^14) to 2^14
    f_ham = np.convolve(data_np, ham_hp)
    f_black = np.convolve(data_np, black_hp)

    # FFT
    y_fft  = np.fft.fft(data_np)
    y_fft_ = np.fft.fft(fir.hamming(len(f_black))[:-1]*(f_black))
    gain_coeff = 10.0 # Gain for freqs values    1.5
    spec_data = np.abs(y_fft_[0:CHUNK] / CHUNK * gain_coeff)

    spec_data = sgf.savgolfilt(spec_data, 5, 7, 1)
    maxs, mins = peakdetect.peakdet(spec_data, 0.085) # 0.035

    # Convert taps number in frequencies
    if (len(maxs) > 0):
        for i in range(len(maxs)):
            maxs[i][0] *= RATE/CHUNK*0.8
            #maxs[0:len(maxs)][0] *= RATE/CHUNK
        maxs = maxs[:len(maxs) // 2] # Get first part of vector
    
    #Delete peaks lower then threshold
    flag = True
    while(flag):
        flag = False
        for i in range (len(maxs)):
            if (maxs[i][1]<0.7): # 0.5
                maxs = np.delete(maxs,i,0)
                flag = True
                break
    
    #Print peaks 
    #if (len(maxs)>0):
        #print(list(maxs))

    red_check0 = False
    red_check1 = False
    blue_check0 = False
    blue_check1 = False

    for i in range(len(maxs)):
        #Red check
        if((maxs[i][0] > 510) and (maxs[i][0] < 640)
           and (maxs[i][1] > 1.7)):
            red_check0 = True
        if(((maxs[i][0] > 1500 and maxs[i][0] < 1550) 
            or (maxs[i][0] > 1750 and maxs[i][0] < 1850))
            and maxs[i][1] > 1.2):
            red_check1 = True
        #Blue check
        if((maxs[i][0] > 250) and (maxs[i][0] < 450) 
           and (maxs[i][1] > 1.2)):
            blue_check0 = True
        if((maxs[i][0] > 1150) and (maxs[i][0] < 1450) 
           and (maxs[i][1] > 1.2)): # 1.0
            blue_check1 = True

    if (red_check0 and red_check1):
        print('RED')
        print('')
    elif (blue_check0 and blue_check1):
        print('BLUE')
        print('')

    if (len(maxs) > 0 and not(red_check0 and red_check1) and not(blue_check0 and blue_check1)):
        print('I hear something')
