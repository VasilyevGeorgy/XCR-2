import numpy as np
import pylab
import math

def savgol1Dcoeff(order=2,nump=5):
    #variable
    z = np.arange(-(nump-1)/2,(nump+1)/2).reshape(-1,1)
    #Jacobian
    j = np.hstack(np.power(z,n) for n in range(order+1))
    #for n in range(order+1):
    #    j = np.hstack(np.power(z,n))
    jt = np.transpose(j)
    jtj = np.matmul(jt,j)
    ijtj = np.linalg.inv(jtj)
    c = np.matmul(ijtj,jt) #iJTJ_JT
    return c

def savgolfilt(data,order=2,nump=5,h=2):
    savgolcoeff = savgol1Dcoeff(order,nump)
    #Since we need only the coeff a0
    coeff = savgolcoeff[0,:]
    print (coeff)
    #padding the original data for taking the boundary values
    pad_length = math.ceil(h*(nump-1)/2)
    half_window = pad_length
    data_pad = np.pad(data, (math.ceil(pad_length),math.ceil(pad_length)),'constant',constant_values=(0,0))
    data_len = len(data)
    data_pad_len = len(data_pad)
    new_data = np.zeros(data_len)
    for i in range(math.ceil(pad_length),math.ceil(data_pad_len-pad_length)):
        data_window = data_pad[i-half_window:i+half_window+1]
        data_smooth = data_window[[h*n for n in range(nump)]]
        new_data[i-math.ceil(pad_length)] = np.sum(np.multiply(data_smooth,coeff))
    return new_data

def main():
    f0 = 20 # Hz
    ts = 1/100 # sampling frequency is 1/ts = 8192Hz
    x = np.arange(-1, 1, ts)
    signal = (np.cos(2*np.pi*f0*x) + np.sin(2*np.pi*2*f0*x) +
                np.cos(2*np.pi*0.5*f0*x) + np.cos(2*np.pi*1.5*f0*x))
    signal_ = (np.sin(2*np.pi*f0*x))

    savgolfilt(signal)
    pylab.plot(signal, 'b')
    smooth = savgolfilt(signal, 2, 5, 1)
    pylab.plot(smooth, 'r')

    pylab.show()

if __name__ == '__main__':
    main()