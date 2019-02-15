#!/usr/bin/python

import time
import math
import pyaudio
from numpy import linspace,sin,pi,int16, int8, int32

pa = None
s  = None

def init_audio(rate=8000):
  global pa,s
  print("init_audio: Create PyAudio object")
  pa = pyaudio.PyAudio()
  print("init_audio: Open stream")
  s = pa.open(output=True,
            channels=1,
            rate=rate,
            format=pyaudio.paInt16#,
            #output_device_index=0
            )
  print("init_audio: audio stream initialized")

def close_audio():
  global pa,s
  print("close_audio: Closing stream")
  s.close()
  print("close_audio: Terminating PyAudio Object")
  pa.terminate()


def note(freq, len, amp=5000, rate=8000):
 t = linspace(0,len,len*rate)
 data = sin(2*pi*freq*t)*amp
 return data.astype(int16) # two byte integers

def tone(freq=440.0, tonelen=0.5, amplitude=5000, rate=8000):
  global s
  # generate sound
  tone = note(freq, tonelen*2, amplitude, rate)
  # play it    
  s.write(tone)


###### MAIN ######
def main():
  # open audio channel
  init_audio()

  # play tones forever    
  print("tone.main(): start playing tones")
  while True:
    tone(440,1)
    #print(time.ctime())
    time.sleep(2)
    tone(880,1)
    time.sleep(2)


if __name__ == "__main__":
    main()


