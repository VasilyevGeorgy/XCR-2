import pyaudio
import numpy as np
#import matplotlib.pyplot as pyplot

import peakdetect
import customfirwin_ as fir
import savgol_filter as sgf


# Sound stream params
CHUNK = 512 #1024 samples per buffer
FORMAT = pyaudio.paInt16  # bytes per sample
CHANNELS = 1  # number of channels for micro
RATE = 8000 #1024 * 8  # Sampling frequency; 44100 Hz is default

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

'''
# Create matplotlib figure and axes
fig, (ax, ax2) = pyplot.subplots(2, figsize=(15, 7))
# variables for plotting
x = np.arange(0, 2 * CHUNK, 2)
x_fft = np.linspace(0, nyq, CHUNK)
# create a line objects
line, = ax.plot(x, np.random.rand(CHUNK), '-', lw=2) # **kwargs: '-' is solid line; lw is line width
line_fft, = ax2.semilogx(x_fft, np.random.rand(CHUNK), '-', lw = 2)
# basic formatting for the axes
ax.set_title('AUDIO WAVEFORM')
ax.set_xlabel('samples')
ax.set_ylabel('volume')
ax.set_ylim(-1.2, 1.2)
ax.set_xlim(0, 2 * CHUNK)
pyplot.setp(ax, xticks=[0, CHUNK, 2 * CHUNK],yticks=[-1,0,1]) # set properties
pyplot.setp(ax.set_yticklabels(("-A","","A")))
ax2.set_xlim(20, nyq)
# show the plot
pyplot.show(block=False)
'''

while True:

    # Get binary data
    data = stream.read(CHUNK)
    data_int = np.frombuffer(data, dtype=np.int16) # Convert data from buffer to int
    data_np = [(i/(2**14)) for i in data_int] # 16 bits = 2^16; first bit for sign; 2^15/2: from -(2^14) to 2^14
    #data_np = lfilter(taps, 1.0, data_np) # filter is used
    #filter the signals
    f_ham = np.convolve(data_np, ham_hp)
    f_black = np.convolve(data_np, black_hp)

    #line.set_ydata(data_np)

    # FFT
    y_fft  = np.fft.fft(data_np)
    y_fft_ = np.fft.fft(fir.hamming(len(f_black))[:-1]*(f_black))
    #print(len(y_fft_))
    gain_coeff = 1.55 # Gain for freqs values    1.5
    spec_data = np.abs(y_fft_[0:CHUNK] / CHUNK * 2)

    spec_data = sgf.savgolfilt(spec_data, 3, 5, 1)

    #spec_data_ = [0]*int(nyq)
    #for i in range(len(spec_data)):
    #    spec_data_[int(i*nyq/CHUNK)] = spec_data[i]

    #print(np.amax(spec_data))

    # Freq curve smoothing
    #spec_data_smooth = savgol_filter(spec_data, 5, 2)
    # Peak detecting
    maxs, mins = peakdetect.peakdet(spec_data, 0.06)

    # Convert taps number in frequencies
    if (len(maxs) > 0):
        for i in range(len(maxs)):
            maxs[i][0] *= RATE/CHUNK*0.8
            #maxs[0:len(maxs)][0] *= RATE/CHUNK
        maxs = maxs[:len(maxs) // 2] # Get first part of vector

    print(list(maxs))
    #print(len(spec_data)*RATE/CHUNK)

    #line_fft.set_ydata(spec_data)

    #fig.canvas.draw()
    #fig.canvas.flush_events()

    #print(len(data_int))
    #print(list(data_int))
