function hn= noiseEntropy(sig_N,z,pz)

M = length(z);
buff = 0;
for i = 1:M
    buff = buff + pz(i)*log(sig_N^2 + z(i)^2);
end;
hn = buff +1;


