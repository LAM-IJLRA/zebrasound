# -*- coding: utf-8 -*-
"""
Created on Thu Apr  1 12:12:01 2021

@author: argan
"""
import matplotlib.pyplot as plt
plt.style.use('seabornCustom')
import numpy as np
from numpy import genfromtxt
import scipy.io.wavfile as wav

duration = 3
fe=44100
te=1/fe
t=np.arange(duration*fe)*te

dataName = "roi_means.csv"
clusterName = "clusters.csv"

rawData = genfromtxt(dataName, delimiter=',')
clusters = genfromtxt(clusterName, delimiter = ",", missing_values=' ')

(dimX, dimY) = rawData.shape
usedData = rawData[1:dimX-1, 1:dimY-1]


feData = 50
duration = (dimX-1)/feData
fe=44100


def preproc(data, norm=255):
    data = data
    meanVector = np.mean(data, 0).reshape((1, data.shape[1]))
    stdDevVector = np.std(data, 0).reshape((1,data.shape[1]))
    
    meanMatrix = np.tile(meanVector, (data.shape[0],1))  
    stdDevMatrix = np.tile(stdDevVector, (data.shape[0],1)) 
    
    outputMatrix = np.abs(data-meanMatrix)/stdDevMatrix
    
    return outputMatrix/255.0


def Thresh(data, k=3):
    stdDevVector = np.std(data, 0).reshape((1,data.shape[1]))
    stdDevMatrix = k*np.tile(stdDevVector, (data.shape[0],1)) 
    
    index = np.where(data<stdDevMatrix)
    
    outputMatrix = np.copy(data)
    outputMatrix[index] = 0
    
    return outputMatrix

fp = preproc(usedData)
fn = Thresh(fp, k=1.4)

## Upsampling
upsamplingFactor = fe/feData


## retrieve cluster 1
cluster1 = clusters[0,2:clusters.shape[1]-1][tuple(np.where(np.isnan(clusters[0,2:clusters.shape[1]-1])!=True))]

fdummy = fn[:, 0].repeat(upsamplingFactor, axis = 0)
sonifiedCluster = np.zeros(fdummy.shape)
ii = 1
for neuron in cluster1:
    ind = neuron-1
    fd = fn[:, int(ind)].repeat(upsamplingFactor, axis = 0)
    t = np.arange(0, fd.shape[0])*te
    carrier = np.sin(ii*2*np.pi*110*t)/172
    sonifiedCluster += carrier * fd
    ii*=2

sonifiedCluster /= np.max(sonifiedCluster)


wav.write("res.wav", fe, sonifiedCluster)

fig = plt.figure()
ax=fig.gca(projection = "3d")

#%%  plot
fig = plt.figure()
ax=fig.gca(projection = "3d")
x=fn[:,9]
y=fn[:,10]
z=np.arange(x.size)

diff = 10

cluster1=np.sort(cluster1)

for ind in np.arange(cluster1.size):
    neuron1 = cluster1[ind]
    neuron2 = cluster1[ind-diff]
    x=fn[:,int(neuron1)]
    y=fn[:,int(neuron2)]
    ax.scatter(x, y, z)
   
            
ax.set_ylabel("y")
ax.set_xlabel("x")
ax.set_title("diff="+str(diff))
#ax.legend()