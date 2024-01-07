function obj= mutualInformation(x)

load noiseParaX.mat;

N = length(x);

pz = x(1:N/2);
z = x(N/2+1:N);

hy = outEntropy(sig_N,z,pz);
hn = noiseEntropy(sig_N,z,pz);
obj1 = hy - hn;
obj = -obj1;