clear
clc
e = 0.001;
l = 0.0021:0.0001:0.01;
a = zeros(100,1);
b = zeros(100,1);
a(1) = -4; b(1) = 4;
% Choose a function by removing its '%' and by placing it on the other 2
%f = @(x) (x-3)^2 + (sin(x+3))^2;
%f = @(x) (x-1) * cos(x/2) + x^2;
f = @(x) (x+2)^2 + exp(x-2) * sin(x+3);
x1 = zeros(100,1);
x2 = zeros(100,1);
K = zeros(length(l),1);
for i = 1:length(l)
    k = 1;
    while b(k)-a(k) >= l(i)
        x1(k) = (a(k)+b(k))/2 - e;
        x2(k) = (a(k)+b(k))/2 + e;
        if f(x1(k)) < f(x2(k))
            a(k+1) = a(k);
            b(k+1) = x2(k);
        else
            a(k+1) = x1(k);
            b(k+1) = b(k);
        end
        k = k + 1;
    end
    K(i) = k;
end
f_calculations = 2 * K;
figure(1)
plot(l,f_calculations,'green')
hold on
title('Number of Objective Function f3 calculations with ε=0.001')
xlabel('𝑙')
ylabel('Number of function calculations')