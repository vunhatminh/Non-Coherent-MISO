function [c,ceq] = constraintZ(x)

load noiseParaZ.mat

N = length(x);

pz = x(1:N/2);
z = x(N/2+1:N);

% c = [sum(px .* abs(x1).^2) - P1,sum(px .* abs(x2).^2) - P2, -px(1),-px(2),-px(3)];
% ceq = [sum(px) - 1 ];

% c = [ sum(px .* abs(x1).^2) - P1 , sum(px .* abs(x2).^2) - P2 ];
% ceq = [ sum(px) - 1 ];

c = [ sum(pz .* z.^2) - Pz  ];
ceq = [ sum(pz) - 1 ];