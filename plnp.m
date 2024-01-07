function pvlnpv= plnp(sig_N,z,pz,v)

pvlnpv = outProb(sig_N,z,pz,v).*log(outProb(sig_N,z,pz,v));

