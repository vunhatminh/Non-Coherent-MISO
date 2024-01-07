function objz= maxz(x)

load noisePara2.mat

N = length(x);
M = N/5;

px = x(1:M);
x1b = x(M+1:3*M);
x2b = x(3*M+1:5*M);

x1 = zeros(1,M);
x2 = x1;
z= x1;
buff = 0;

for i = 1:M
    x1(i) = x1b(2*i-1) + 1j*x1b(2*i);
    x2(i) = x2b(2*i-1) + 1j*x2b(2*i);
    z(i) = sqrt([x1(i) x2(i)]*H*[x1(i) x2(i)]');
    buff = buff + z(i)^2*px(i);
end

objz = -buff;

