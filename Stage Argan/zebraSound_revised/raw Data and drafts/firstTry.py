# -*- coding: utf-8 -*-
"""
Created on Wed Mar 31 17:18:18 2021

@author: argan
"""
import matplotlib.pyplot as plt
plt.style.use('seabornCustom')
import numpy as np
from mpl_toolkits.mplot3d import Axes3D
import scipy.io.wavfile as wav
import scipy.signal as sig
fe = 44100
te = 1/fe

t = np.arange(0,5*fe)*te

yCos= np.cos(2*np.pi*0.5*t)
yCos2= np.cos(2*np.pi*0.3*t + 0)


fig = plt.figure()
ax = fig.gca(projection='3d')
ax.plot(yCos, yCos2, t)


V = np.sin(2*np.pi*55*yCos) + np.sin(4*np.pi*55*yCos2)
output = V

fig2 = plt.figure()
ax2 = fig2.gca()

ax2.plot(t, output)

f, t, spectro = sig.spectrogram(output, fe)

fig3 =plt.figure()
plt.pcolormesh(np.abs(spectro))


wav.write("res.wav", fe, output)