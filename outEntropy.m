function hv= outEntropy(sig_N,z,pz)

v=sym('v','real');

hv = -double(int(plnp(sig_N,z,pz,v),0,inf));

% v = 0:0.1:100;
% pvlnpv = zeros(1,length(v));
% for i = 1:length(v)
%     pvlnpv(i) = plnp(sig_N,z,pz,v(i));
% end
% 
% hv = -trapz(v,pvlnpv);