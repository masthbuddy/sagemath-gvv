#Import 
import sys
from sage.all import*
import numpy as np
import mpmath as mp
import math
import matplotlib.pyplot as plt

#Functional Definition
def qfun(x):
 return 0.5*mp.erfc(x/sqrt(2))

#Main program 
snrlen=10
snrdb=np.linspace(0,9,10)
simlen=1e5
err=[]
ber=[]
M = 4
N = sqrt(M)
s3 = np.sqrt(3)

for i in range (0,snrlen):
 n1=np.random.normal(0,1,simlen)
 n2=np.random.normal(0,1,simlen)
 n3=np.random.normal(0,1,simlen)
 n4=np.random.normal(0,1,simlen)
 n5=np.random.normal(0,1,simlen)
 n6=np.random.normal(0,1,simlen)
 
 snr=10**(0.1*i)
 c = np.sqrt(2)+1

 
 r1=sqrt(snr)+n1
 r2=sqrt(snr)+n2
 r3=(1+(np.sqrt(3)))*sqrt(snr)+n3
 r4=n4


 
#########outer point##################
 err_ind1=np.nonzero(  ((s3*r3 + r4)>(1+s3)*sqrt(snr)) & (( s3*r3-r4 )>(1+s3)*sqrt(snr)))
 
 
 
 
 err1 = np.size(err_ind1)/(simlen)
 errp1 = (1-err1)
 

 

 #########inner point###################
 err_ind11=np.nonzero((r1>0) & (r2>0) & (((1/s3)*r1-r2)>((1/s3)*2-1-(s3/2))*sqrt(snr)) & (( s3*r1-r2 ) <(1+s3)*sqrt(snr)))
 
   
 
 
 
 err2 = np.size(err_ind11)/(simlen)
 
 errp2 = 1-err2
 
 
 
 #################################
 err_n=(4*errp1+ 4*errp2)/8
 err.append(err_n) 
 

plt.semilogy(snrdb,err)
plt.grid()
plt.xlabel('SNR($\eta$)')
plt.ylabel('SER for M-QAM')
plt.title('SER of M-QAM vs $\eta$')
plt.legend(('Simulation Result','Analytical Plot'),loc='lower right')
plt.savefig('circular_8qam')


 

