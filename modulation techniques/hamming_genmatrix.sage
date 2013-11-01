MS = MatrixSpace(GF(2),3,7)
G = MS([[1,0,0,1,1,1,0], [0,1,0,0,1,1,1], [0,0,1,1,1,0,1]])
C = LinearCode(G)                                          
dmin = C.minimum_distance()                                       
MS1 = MatrixSpace(GF(2),1,3)
G1 = MS1([[1,1,1]])

G2 = G1*G
print "min distance"
print dmin


G4 = C.check_mat()
print "parity-check matrix"
print G4

G5 = C.gen_mat()
print "generator matrix"
print G5


