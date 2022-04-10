clc
clear
l = 0.01;
a = zeros(100,1);
b = zeros(100,1);
a(1) = -4; b(1) = 4;
syms x
% Choose a function by removing its '%' and by placing it on the other 2
%f = (x-3)^2 + (sin(x+3))^2;
%f = (x-1) * cos(x/2) + x^2;
f = (x+2)^2 + exp(x-2) * sin(x+3);

f1 = diff(f);
n = 0;
while 0.5^n > l/(b(1)-a(1))
    n = n + 1;
end

X = zeros(100,1);

for k = 1:n
    X(k) = (a(k)+b(k))/2;
    f1_Xk = double(vpa(subs(f1,x,X(k))));
    if f1_Xk > 0
        a(k+1) = a(k);
        b(k+1) = X(k);
    elseif f1_Xk < 0
        a(k+1) = X(k);
        b(k+1) = b(k);
    else
        fprintf('paragogos mhden\n');
    end
end
fprintf('---- Bisection Method with derivative ----\n')
fprintf('The limits which contain the minimum value of f function are [a, b] = [%f, %f]\n',a(k),b(k))
            