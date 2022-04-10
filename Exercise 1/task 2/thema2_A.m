clc
clear
l = 0.01;
gamma = 0.618;
a = zeros(100,1);
b = zeros(100,1);
a(1) = -4; b(1) = 4;
% Choose a function by removing its '%' and by placing it on the other 2
f = @(x) (x-3)^2 + (sin(x+3))^2;
%f = @(x) (x-1) * cos(x/2) + x^2;
%f = @(x) (x+2)^2 + exp(x-2) * sin(x+3);

x1 = zeros(100,1);
x2 = zeros(100,1);
x1(1) = a(1) + (1-gamma)*(b(1)-a(1));
x2(1) = a(1) + gamma*(b(1)-a(1));

k = 1;
while b(k)-a(k) >= l   
    if f(x1(k)) > f(x2(k))
        a(k+1) = x1(k);
        b(k+1) = b(k);
        x2(k+1) = a(k+1)+gamma*(b(k+1)-a(k+1));
        x1(k+1) = x2(k);
    else
        a(k+1) = a(k);
        b(k+1) = x2(k);
        x2(k+1) = x1(k);
        x1(k+1) = a(k+1)+(1-gamma)*(b(k+1)-a(k+1));
    end
    k = k + 1;
end
fprintf('---- Golden Method ----\n')
fprintf('The limits which contain the minimum value of f function are [a, b] = [%f, %f]\n',a(k),b(k))
