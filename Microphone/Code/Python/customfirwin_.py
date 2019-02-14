#!/usr/bin/env python
"""Module to design window based fir filter and analyse the frequency response
of fir filters.

This implementation is largely based on Chapter 16 of The Scientist and
Engineer's Guide to Digital Signal Processing Second Edition.

"""

#import pylab
import numpy

def hamming(M):
    """Return an M + 1 point symmetric hamming window."""
    if M%2:
        raise Exception('M must be even')
    return 0.54 - 0.46*numpy.cos(2*numpy.pi*numpy.arange(M + 1)/M)

def blackman(M):
    """Return an M + 1 point symmetric point hamming window."""
    if M%2:
        raise Exception('M must be even')
    return (0.42 - 0.5*numpy.cos(2*numpy.pi*numpy.arange(M + 1)/M) +
            0.08*numpy.cos(4*numpy.pi*numpy.arange(M + 1)/M))

def sinc_filter(M, fc):
    """Return an M + 1 point symmetric point sinc kernel with normalised cut-off
    frequency fc 0->0.5."""
    if M%2:
        raise Exception('M must be even')
    #print(len(numpy.sinc(2*fc*(numpy.arange(M + 1) - M/2))))
    return numpy.sinc(2*fc*(numpy.arange(M + 1) - M/2))


def get_freqs(x):
    array = numpy.zeros(len(x) // 2)
    fft = numpy.fft.fft(x)
    for i in range(len(x) // 2):
        array[i] = numpy.abs(fft[i * 2]) / (len(x) // 2)
    array = array[:len(array) // 2]  # Get first part of vector

    return array

def get_freqs_(x):

    array = numpy.zeros(len(x))
    fft = numpy.fft.fft(x)
    for i in range(len(x)):
        array[i] = numpy.abs(fft[i])
    array = array[:len(array)//2]  # Get first part of vector

    return array

def build_filter(M, fc, window=None):
    """Construct filter using the windowing method for filter parameters M
    number of taps, cut-off frequency fc and window. Window defaults to None
    i.e. a rectangular window."""
    if window is None:
        h = sinc_filter(M, fc)
    else:
        h = sinc_filter(M, fc)*window(M)
    return h/h.sum()
    
'''
def main():
    f0 = 440 #20Hz
    ts = 1/8192 #1/2**13 # 0.01 i.e. sampling frequency is 1/ts = 100Hz
    x = numpy.arange(-1, 1, ts)
    signal_ = (numpy.cos(2*numpy.pi*f0*x) + numpy.sin(2*numpy.pi*2*f0*x) +
                numpy.cos(2*numpy.pi*0.5*f0*x) + numpy.cos(2*numpy.pi*1.5*f0*x))
    signal = (numpy.sin(2*numpy.pi*f0*x))

    #build up some filters
    #Low pass
    M = 256 #number of taps in filter
    fc = 0.4756 #from 100 to 4096 bandpass
    ham_lp = build_filter(M, fc, window=hamming)
    black_lp = build_filter(M, fc, window=blackman)
    rect_lp = build_filter(M, fc)

    #High Pass
    shift = (numpy.cos(2*numpy.pi*0.5*numpy.arange(M + 1)))
    ham_hp = ham_lp*shift
    black_hp = black_lp*shift
    #rect_hp = rect_lp*shift

    #filter the signals
    f_ham = numpy.convolve(signal, ham_hp)
    f_black = numpy.convolve(signal, black_hp)
    #f_rect = numpy.convolve(signal, rect_hp)

    #plotting
    pylab.figure()
    pylab.subplot(3,1,1)
    pylab.title('Original Spectrum')
    pylab.xlabel('Frequency')
    pylab.plot(get_freqs(signal))
    pylab.subplot(3,1,2)
    pylab.title('Highpass Filter Frequency Response')
    pylab.xlabel('Normalised Frequency')
    pylab.plot(get_freqs_(ham_hp))
    pylab.plot(get_freqs_(black_hp))
    pylab.legend(('Hamming', 'Blackman'))
    #window and fft
    pylab.subplot(3,1,3)
    pylab.title('Filtered Spectrum')
    pylab.xlabel('Frequency')
    pylab.plot(get_freqs(hamming(len(f_black))[:-1]*(f_black)))
    pylab.plot(get_freqs(hamming(len(f_ham))[:-1]*(f_ham)))
    pylab.subplots_adjust(hspace = 0.6)

    #print(len(get_freqs(hamming(len(f_black))[:-1]*(f_black))))

    pylab.show()

if __name__ == '__main__':
    main()
'''
