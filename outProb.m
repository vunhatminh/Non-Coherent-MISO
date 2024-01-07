function pv= outProb(sig_N,z,pz,v)

M = length(z);
buff = 0;
for i = 1:M
    buff = buff + pz(i)*condProb(sig_N, z(i), v);
end;
pv = buff;