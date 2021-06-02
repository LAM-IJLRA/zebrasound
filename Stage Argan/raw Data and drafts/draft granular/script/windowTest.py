# -*- coding: utf-8 -*-
"""
Created on Thu Jun 17 13:58:44 2021

@author: argan
"""
import matplotlib.pyplot as plt
plt.style.use('seabornCustom')
import numpy as np
import scipy.io.wavfile as wav

fe, buffer = wav.read("TapeTrashHat_827.wav")

buffer = buffer[:,0] + buffer[:,1]
a = np.linspace(0,1,5)
n =np.arange(0,len(buffer))
N=len(n)

plt.figure()

a0 = 0.35
a1=0.48
a2=0.14
a3=0.01


for ind in a :
    print(ind)
    #w = (np.sin(np.pi*n**ind/(N**ind)))**2.
    w=a0 - a1 * np.cos(2*np.pi*n**ind/N**ind) + a2 * np.cos(4*np.pi*n**ind/N**ind) - a3*np.cos(6*np.pi*n**ind/N**ind)
    plt.plot(n, w, label = str(ind))
    
plt.legend()

plt.figure()

for ind in a :
    print(ind)
    w = (np.sin(np.pi*n**ind/(N**ind)))**2.
    windowed = w*buffer
    plt.plot(n, windowed, label = str(ind))
    wav.write("windowed"+str(ind)+".wav", fe, windowed)
    
plt.legend() 
