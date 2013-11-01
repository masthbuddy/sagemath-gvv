import mpmath as mp
import matplotlib.pyplot as plt
import numpy as np

def qfunc(x):						
	return (0.5*mp.erfc(x/sqrt(2)))



draws = 1e5
simlen = 10

snrdb = np.linspace(1,10,10)
ber_ana1 = []
ber_ana2 = []
ber_ana3 = []
ber_ana4 = []
per_ana1 = []
per_ana2 = []
per_ana3 = []
per_ana4 = []

berPSK_anal=[]
berQAM_anal=[]
No=2


for i in range(1,11):
	snr = 10^(0.1*i)	
	ber_ana1.append(4*(1-(1/sqrt(4)))*qfunc(sqrt(snr)))
	ber_ana2.append(4*(1-(1/sqrt(16)))*qfunc(sqrt(snr)))
	ber_ana3.append(4*(1-(1/sqrt(64)))*qfunc(sqrt(snr)))
	
	per_ana1.append(2*qfunc(sqrt(2*snr)*sin(pi/4)))
	per_ana2.append(2*qfunc(sqrt(2*snr)*sin(pi/16)))
	per_ana3.append(2*qfunc(sqrt(2*snr)*sin(pi/64)))
	
        
plt.clf()
#plt.semilogy(snrdb,berPSK_anal,snrdb,berQAM_anal,'y')
plt.semilogy(snrdb,ber_ana1,'o',snrdb,ber_ana2,'p',snrdb,ber_ana3,'o',snrdb,per_ana1,'r',snrdb,per_ana2,'c',snrdb,per_ana3,'y')
#plt.semilogy(snrdb,ber_ana2,'p')
#plt.semilogy(snrdb,ber_ana3,'o')

#plt.semilogy(snrdb,per_ana1,'r')
#plt.semilogy(snrdb,per_ana2,'c')
#plt.semilogy(snrdb,per_ana3,'y')

plt.grid()

plt.savefig('M-QAMvsM-PSK	.eps')
