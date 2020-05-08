import random
import pandas as pd
import numpy as np
from scipy import signal

slen = 60
t = np.linspace(1, slen, slen)

s1 = 10*np.sin(5*t/(np.pi)) + np.random.normal(0,1,slen)
s2 = np.sin(t/(np.pi)) +  6*np.sin(2*t/(np.pi)) +np.random.normal(0,1,slen)
s3 = 8*np.sin(2*t/(np.pi)) + 6*np.sin(12*t/(np.pi))+ np.random.normal(0,1,slen)
s4 = 5 *signal.square(2*np.pi/15*t, duty=0.3)+ np.random.normal(0,1,slen)
s5 = 12 *signal.sawtooth(2*np.pi/5*t, width=0.3)+ np.random.normal(0,1,slen)

sequence = np.vstack((s1,s2,s3,s4,s5))
sequence = np.hstack([sequence]*24*60)
sequence = sequence.reshape(86400,5)

np.save("sequence",sequence)
