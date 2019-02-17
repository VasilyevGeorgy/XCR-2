import pyaudio
import numpy as np
import time
import pickle
import sys

import peakdetect
import customfirwin_ as fir
import savgol_filter as sgf


def get_peaks(data, delta=0.085, damping=True, RATE=8000, CHUNK=1024):
    '''
    :param data: spectrum data
    :param delta: see peakdetect.py
    :param damping: neglect a point if amplitude is lower than threshold
    :return: peaks as array of points(freq;amplitude)
    '''
    maxs, mins = peakdetect.peakdet(data, delta)  # 0.035

    # Convert taps number in frequencies
    if (len(maxs) > 0):
        for i in range(len(maxs)):
            maxs[i][0] *= RATE / CHUNK * 0.8
            # maxs[0:len(maxs)][0] *= RATE/CHUNK
        maxs = maxs[:len(maxs) // 2]  # Get first part of vector

    # Delete peaks lower then threshold
    while (damping):
        damping = False
        for i in range(len(maxs)):
            if (maxs[i][1] < 0.7):  # 0.5
                maxs = np.delete(maxs, i, 0)
                damping = True
                break

    # Print peaks
    # if (len(maxs)>0):
    # print(list(maxs))

    return maxs

def red_blue(data):
    '''
    simple 'red'/'blue' word detector for a specific voice
    :param data: frequency peak points
    :return: recognized word as string
    '''
    red_check0 = False
    red_check1 = False
    blue_check0 = False
    blue_check1 = False

    for i in range(len(data)):
        #Red check
        if((data[i][0] > 510) and (data[i][0] < 640)
           and (data[i][1] > 1.7)):
            red_check0 = True
        if(((data[i][0] > 1500 and data[i][0] < 1550)
            or (data[i][0] > 1750 and data[i][0] < 1850))
            and data[i][1] > 1.2):
            red_check1 = True
        #Blue check
        if((data[i][0] > 250) and (data[i][0] < 450)
           and (data[i][1] > 1.2)):
            blue_check0 = True
        if((data[i][0] > 1150) and (data[i][0] < 1450)
           and (data[i][1] > 1.2)): # 1.0
            blue_check1 = True

    if (red_check0 and red_check1):
        return 'Red'
    elif (blue_check0 and blue_check1):
        return 'Blue'
    elif (len(data) > 0):
        return 'something'
    else:
        return 'none'

def simple_sound_ckeck(data):
    color = red_blue(data)

    if (color == 'something'):
        print('I hear something')
    elif (color != 'none'):
        print(color)

def save_freqs(spec_data, fname, num):
    '''
    :param spec_data: frequency spectrum list
    :param fname: file name for sound samples
    :param num: number of saved samples
    :return: num
    '''
    print('Number of samples: ',num)
    add_to_file = True
    file = open(fname, 'rb')
    for i in range(num):
        sav_data = pickle.load(file)
        corr = np.corrcoef(spec_data, sav_data)

        if corr[0][1] > 0.8:  # 0.6 is optimal
            print('Similar one is contained already, correlation:', corr[0][1])
            add_to_file = False

    file.close()

    if (add_to_file):
        file = open(fname, 'ab')
        pickle.dump(spec_data, file)
        file.close()
        num += 1
        print('New sample has been added')

    return num

def init_file(fname):
    file = open(fname, 'wb+')
    sav_data = np.random.rand(1,1024)
    pickle.dump(sav_data, file)
    file.close()

    num = 1

    return num

def add_freqs(sample, samples_list):

    is_new = True
    print('Number of samples:', len(samples_list))
    for i in range(len(samples_list)):
        corr = np.corrcoef(sample, samples_list[i])
        if corr[0][1] > 0.8:
            is_new = False
            print('Similar one is contained already, correlation:', corr[0][1])
            break

    if is_new:
        samples_list.append(sample)
        print('New sample has been added')

    return samples_list


def main():

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

    print('START SOUND SIGNAL PROCESSING')

    #fname = 'freqs.txt'
    #counter = init_file(fname)

    sav_data = [np.random.rand(1,1024)]

    while True:

        # Get binary data
        data = stream.read(CHUNK, exception_on_overflow=False) # ,exception_on_overflow = False; add this arg for RASPBERRY
        time.sleep(0.1)
        data_int = np.frombuffer(data, dtype=np.int16) # Convert data from buffer to int
        data_np = [(i/(2**14)) for i in data_int] # 16 bits = 2^16; first bit for sign; 2^15/2: from -(2^14) to 2^14
        f_black = np.convolve(data_np, black_hp)

        # FFT
        y_fft_ = np.fft.fft(fir.hamming(len(f_black))[:-1]*(f_black))
        gain_coeff = 10.0 # Gain for freqs values    10.0
        spec_data = np.abs(y_fft_[0:CHUNK] / CHUNK * gain_coeff)

        spec_data = sgf.savgolfilt(spec_data, 5, 7, 1)

        #print(spec_data)
        maxs = get_peaks(spec_data)
        #simple_sound_ckeck(maxs)

        if len(maxs) > 0:
            sav_data = add_freqs(spec_data, sav_data)

        #print('Size in bytes of list:',sys.getsizeof(sav_data))

if __name__ == '__main__':
    main()
