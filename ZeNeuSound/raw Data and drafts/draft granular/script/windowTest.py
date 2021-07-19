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
#buffer = np.sin(np.linspace(0.,40*2*np.pi,2048))
a = [0.1, 0.3, 0.5, 0.8, 0.9]
n =np.arange(0,len(buffer))
N=len(n)

fig = plt.figure()

a0 = 0.35
a1=0.48
a2=0.14
a3=0.01

axTemp = fig.add_subplot(211)
axfreq = fig.add_subplot(212)
for ind in a :
    print(ind)
    #w = (np.sin(np.pi*n**ind/(N**ind)))**2.
    w=a0 - a1 * np.cos(2*np.pi*n**ind/N**ind) + a2 * np.cos(4*np.pi*n**ind/N**ind) - a3*np.cos(6*np.pi*n**ind/N**ind)
    axTemp.plot(n, w, label = "a = " + str(ind))
    w_fft = np.fft.fftshift(np.fft.fft(w))
    axfreq.plot(np.linspace(-1.,1.,len(w_fft)), np.abs(w_fft), label = "a = " + str(ind))
    
    
axTemp.legend(), axTemp.set_xlabel(r"$n$"), axTemp.set_ylabel(r"$w(n)$ (UA)"), axTemp.set_title("Enveloppe, domaine temporel")
axfreq.legend(), axfreq.set_xlabel(r"$\nu$"), axfreq.set_ylabel(r"$|W(\nu)|$ (UA)"), axfreq.set_title("Enveloppe, domaine fréquentiel"), axfreq.set_xlim(-0.004, 0.004)
fig.set_tight_layout(True,)
plt.figure()

for ind in a :
    print(ind)
    w = (np.sin(np.pi*n**ind/(N**ind)))**2.
    windowed = w*buffer
    plt.plot(n, windowed/np.max(abs(windowed)), label = "a = " + str(ind))
    wav.write("windowed"+str(ind)+".wav", fe, windowed)
    
plt.legend() 
plt.xlabel("n")
plt.ylabel("x(n) (UA)")
