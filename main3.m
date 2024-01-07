clc
clear all 

sig_N = 1;
H_ori = [1 0;0 1];
[U S V] = svd(H_ori);
H = H_ori/S(1);
TotalPower = 1.2;
P1 = TotalPower/2;
P2 = TotalPower - P1;
Tx = 2;

save noiseParaX.mat TotalPower P1 P2 H sig_N; 

M = 3; % mass point

% Calculate constraint on Z

if H(1,2) > 0 
    Pz = H(1,1)*P1 + H(2,2)*P2 + 2*H(1,2)*sqrt(P1*P2);
else
    Pz = H(1,1)*P1 + H(2,2)*P2 - 2*H(1,2)*sqrt(P1*P2);
end

save noiseParaZ.mat Pz H sig_N;

% x1 = zeros(2,M);
% x1(1,M) = sqrt(P1/2);
% x1(2,M) = sqrt(P1/2);
% x2 = zeros(2,M);
% x2(1,M) = sqrt(P2/2);
% x2(2,M) = sqrt(P2/2);
% px = ones(1,M)/M;
% 
% x_b = reshape([x1 x2],1,Tx*2*M);
% x0 = [px x_b];
% lb = zeros(1, 5*M);
% 
% gs = GlobalSearch;
% opts = optimset('Display','iter','Algorithm','interior-point', 'TolFun',1e-8);
%          problem = createOptimProblem('fmincon','x0',x0,...
%         'objective',@maxz,'lb',lb,'nonlcon',@constraints,'options',opts);
%           [x_max_z,z_max] = run(gs,problem)


z0 = zeros(1,M);
z0(M) = sqrt(Pz);
pz0 = ones(1,M)/M;
 
x0(1:M) = pz0;
x0(M+1:2*M) = z0;
         
lb = zeros(1, 2*M);
 
gs = GlobalSearch;
opts = optimset('Display','iter','Algorithm','interior-point', 'TolFun',1e-8,'TolX',1e-8);
        problem = createOptimProblem('fmincon','x0',x0,...
        'objective',@mutualInformation,'lb',lb,'nonlcon',@constraintZ,'options',opts);
        [z_max_f,fval] = run(gs,problem)

% p_z = x(1:M);
% z = x(M+1:2*M);
% C = -fval;
% 
% Capacity(iter) = C;
% 
% 
% 
% plot(Power,Capacity);
        
