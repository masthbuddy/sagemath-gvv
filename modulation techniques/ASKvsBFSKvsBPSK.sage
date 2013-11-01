#!/usr/bin/sage -python

import sys
from sage.all import *
#The above command brings everything from sage to python
import numpy as np
import mpmath as mp
import matplotlib.pyplot as plt

def qfunc(x):
	return 0.5*mp.erfc(x/sqrt(2))

snrlen = 10
snrdb = np.linspace(0,1,10)
#snrdb = power(10,test)
simlen = 1e5
n=1
err = []
ber_bfsk = []
ber_bpsk=[]
ber_ask = []


for i in range(0,snrlen):
	noise = np.random.normal(0,1,simlen)
	snr = 10**(0.1*i)
	rx = sqrt(snr) + noise
	err_ind = np.nonzero(rx < 0)
	err_n = np.size(err_ind)
#	print err_n
	err.append(err_n/simlen)
	ber_bfsk.append((qfunc(sqrt(snr)/sqrt(n))))
	ber_ask.append((qfunc(sqrt(snr)/sqrt(2*n))))
	ber_bpsk.append((qfunc(sqrt(2*snr/n))))
	
plt.semilogy(snrdb,ber_ask,snrdb,ber_bpsk,snrdb,ber_bfsk)
plt.grid()
plt.legend(('apf\ln \,ber$'),loc='lower right')
plt.savefig('ASKvsBFSKvsBPSK.eps')
print np.size(err)

print np.size(snrdb)
#print rx[200]


#print noise
#print rx

#len = 100;
#x = np.linspace(0,5,len)
#y = []
#z = []

#for i in range(0,len):
    #y.append(n(0.5*mp.erfc(x[i]/(sqrt(2)))))
##    z.append(n(x[i] - 1))

##plt.plot(x,y,x,z)
#plt.semilogy(x,y)
#plt.xlabel('$x$')
#plt.ylabel('$Q(x)$')
#plt.grid()
##plt.legend(('$\ln \,x$','$x-1$'),loc='lower right')
plt.legend(('$\ln \,ber$'),loc='lower right')

#plt.savefig('ass1-2.eps')


#noise=numpy.random.randn(1,10)
#print noise
#signal = numpy.ones(10) 
#snrdb = numpy.arange(10.)
#ber = []
#for i in range(0,10):
    #ber.append(n(0.5*mpmath.erfc(float(snrdb[i])/sqrt(2))))
  
#list_plot(zip(snrdb,ber))

#list_plot_semilogy(zip(snrdb,ber))

#plt.semilogy(snrdb,ber)
#plt.savefig('test.eps')

#A = Matrix([[1,2,3],[3,2,1],[1,1,1]])
#print A
#w = vector([1,1,-4])
#print w
#print w*A



#def iseven(n):
#	return n%2 == 0
	
#print iseven(10)
#print 2**3
#import sys
#from sage.all import *

#if len(sys.argv) != 2:
#    print "Usage: %s <n>"%sys.argv[0]
#    print "Outputs the prime factorization of n."
#    sys.exit(1)

#print factor(sage_eval(sys.argv[1]))
