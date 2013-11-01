#!/usr/local/bin/sage -python

#This program compares the simulation and anlalytical BER in Nakagami-m
#fading for noninteger m
#The following command brings everything from sage to python
import sys
from sage.all import *

#Importing numy, scipy, mpmath and pyplot
import numpy as np
import mpmath as mp
import scipy 
import scipy.stats as sp
#from scipy.integrate import quad
#import scipy.integrate as spint
import matplotlib.pyplot as plt
import subprocess

def qfunc(x):
    return 0.5*mp.erfc(x/sqrt(2))

#p=0.5;
#lambda=standard deviation;

def ber1(n):
    return 0.5*qfunc(n-1) + 0.5*qfunc(n+1)    


vec_qfunc = scipy.vectorize(ber1)
y = scipy.arange(0.0,10.0,1)

    
plt.semilogy(y,vec_qfunc(y),y,vec_qfunc(y),'o')  
plt.xlabel('$SNR(arbitrary Threshold)$')
plt.ylabel('$AvgBER$')
plt.legend('a')
plt.grid()
plt.savefig('arbitrary Threshold_AvgBER.eps')
  
    

