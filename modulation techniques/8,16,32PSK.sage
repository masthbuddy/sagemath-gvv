
import mpmath as mp
import matplotlib.pyplot as plt
import numpy as np

def twqfunc(x):						
	return (mp.erfc(x))



draws = 1e5
simlen = 10
No=2
snrdb = np.linspace(0,simlen-1,simlen)
ber_sim8=[]
ber_sim16=[]
ber_sim32=[]
ber_sim64=[]
ber_anal8=[]
ber_anal16=[]
ber_anal32=[]
ber_anal64=[]



for i in range(0,simlen):
	snr = 10^(0.1*i)
	
	Rx1 = sqrt(snr) + np.random.normal(0,1,draws)
	
	Rx2 = np.random.normal(0,1,draws)
	
	ber_sim8.append(1-((np.size(np.nonzero((Rx1-((2.4142)*abs(Rx2)))>0)))/draws))
	ber_sim16.append(1-((np.size(np.nonzero((Rx1-((5.0273)*abs(Rx2)))>0)))/draws))
	ber_sim32.append(1-((np.size(np.nonzero((Rx1-((10.1532)*abs(Rx2)))>0)))/draws))
	ber_sim64.append(1-((np.size(np.nonzero((Rx1-((20.3555)*abs(Rx2)))>0)))/draws))
	
	ber_anal8.append(twqfunc(sqrt(snr/No)*sin(pi/(8))))
	
	ber_anal16.append(twqfunc(sqrt(snr/No)*sin(pi/(16))))
	
	ber_anal32.append(twqfunc(sqrt(snr/No)*sin(pi/(32))))
	
	ber_anal64.append(twqfunc(sqrt(snr/No)*sin(pi/(64))))
	
	
        
plt.clf()
plt.semilogy(snrdb.T,ber_sim8,snrdb.T,ber_sim16,snrdb.T,ber_sim32,snrdb.T,ber_sim32,snrdb.T,ber_sim64,snrdb.T,ber_anal8,'o',snrdb.T,ber_anal16,'o',snrdb.T,ber_anal32,'o',snrdb.T,ber_anal64,'o')
plt.grid()
plt.savefig('8vs16vs32PSK')

