function pvz = condProb(sig_N, z, v)

pvz = 1/(sig_N^2+ z^2)*exp(-v/(sig_N^2+ z^2));