function [f_hat] = f_hat(a,b,const,u1,u2)

% f(u1,u2) = a(1)G1 + a(2)G2 + ... + a(15)G15 + b
f_hat = 0;
for i=1:15
    f_hat = f_hat + a(i) * Gaussian(u1,u2,const(i,:));
end
f_hat = f_hat + b;
end

