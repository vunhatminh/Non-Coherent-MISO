function [c,ceq] = constraints(x)

load noisePara2.mat

N = length(x);
M = N/5;

px = x(1:M);
x1b = x(M+1:3*M);
x2b = x(3*M+1:5*M);

x1 = zeros(1,M);
x2 = x1;

for i = 1:M
    x1(i) = x1b(2*i-1) + 1j*x1b(2*i);
    x2(i) = x2b(2*i-1) + 1j*x2b(2*i);
end

% c = [sum(px .* abs(x1).^2) - P1,sum(px .* abs(x2).^2) - P2, -px(1),-px(2),-px(3)];
% ceq = [sum(px) - 1 ];

% c = [ sum(px .* abs(x1).^2) - P1 , sum(px .* abs(x2).^2) - P2 ];
% ceq = [ sum(px) - 1 ];

c = [  ];
ceq = [ sum(px .* abs(x1).^2) - P1 , sum(px .* abs(x2).^2) - P2, sum(px) - 1 ];