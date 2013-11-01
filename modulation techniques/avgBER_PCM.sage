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
#def craig(x):
#	theta = np.random.uniform(0,pi/2,simlen)
#	integrand = np.sum(exp(-x**2/(2*sin(theta)**2)))/(2*simlen)
#	return integrand
E=1.5
#p=0.10
N=2
def ber1(k):
	return (0.10)*qfunc((E-k)/sqrt(N*E/2))+(0.9)*qfunc((E+k)/sqrt(N*E/2))
#p=0.25
def ber2(k):
	return (0.25)*qfunc((E-k)/sqrt(N*E/2))+(0.75)*qfunc((E+k)/sqrt(N*E/2))
#p=0.50
def ber3(k):
	return (0.50)*qfunc((E-k)/sqrt(N*E/2))+(0.50)*qfunc((E+k)/sqrt(N*E/2))
#p=0.75
def ber4(k):
	return (0.75)*qfunc((E-k)/sqrt(N*E/2))+(0.25)*qfunc((E+k)/sqrt(N*E/2))
#p=0.9
def ber5(k):
	return (0.9)*qfunc((E-k)/sqrt(N*E/2))+(0.1)*qfunc((E+k)/sqrt(N*E/2))
	
	
#simlen = 1e5
#print craig(0)
#vec_craig = scipy.vectorize(craig)
vec_qfunc = scipy.vectorize(qfunc)
vec_ber1 = scipy.vectorize(ber1)
vec_ber2 = scipy.vectorize(ber2)
vec_ber3 = scipy.vectorize(ber3)
vec_ber4 = scipy.vectorize(ber4)
vec_ber5 = scipy.vectorize(ber5)
#print vec_expint(3,scipy.arange(1.0,4.0,0.5))
y = scipy.arange(-8.0,8.0,0.1)
plt.plot(y,vec_ber1(y),y,vec_ber2(y),y,vec_ber3(y),y,vec_ber4(y),y,vec_ber5(y))
plt.grid()
plt.legend('1 2 3 4')
plt.xlabel('$Threshold$($lambda$)$$')
plt.ylabel('$avgBER$')
plt.savefig('avgBER_PCM')
#print vec_expint(3,scipy.arange(1.0,4.0,0.5))
#special.expn(3,arange(1.0,4.0,0.5))

