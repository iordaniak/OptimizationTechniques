clear
clc
l = 0.01;
e = 0.0001:0.0001:0.0049;
a = zeros(100,1);
b = zeros(100,1);
a(1) = -4; b(1) = 4;
% Choose a function by removing its '%' and by placing it on the other 2
%f = @(x) (x-3)^2 + (sin(x+3))^2;
%f = @(x) (x-1) * cos(x/2) + x^2;
f = @(x) (x+2)^2 + exp(x-2) * sin(x+3);
x1 = zeros(100,1);
x2 = zeros(100,1);
K = zeros(length(e),1);
for i = 1:length(e)
    k = 1;
    while b(k)-a(k) >= l
        x1(k) = (a(k)+b(k))/2 - e(i);
        x2(k) = (a(k)+b(k))/2 + e(i);
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
plot(e,f_calculations)
hold on
title('Calculations for function f3')
xlabel('ε')
ylabel('Number of function calculations')