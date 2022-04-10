clc
clear
l = 0.01;
e = 0.001;
% Choose a function by removing its '%' and by placing it on the other 2
f = @(x) (x-3)^2 + (sin(x+3))^2;
%f = @(x) (x-1) * cos(x/2) + x^2;
%f = @(x) (x+2)^2 + exp(x-2) * sin(x+3);
a = zeros(100,1);
b = zeros(100,1);
a(1) = -4; b(1) = 4;
n = 0;
while (b(1)-a(1))/fibonacci(n) >= l
    n = n + 1;
end

x1 = zeros(100,1);
x2 = zeros(100,1);
x1(1) = a(1)+(fibonacci(n-2)/fibonacci(n))*(b(1)-a(1));
x2(1) = a(1)+(fibonacci(n-1)/fibonacci(n))*(b(1)-a(1));

for k = 1:n-2
    if f(x1(k)) > f(x2(k))
        a(k+1) = x1(k);
        b(k+1) = b(k);
        x1(k+1) = x2(k);
        x2(k+1) = a(k+1)+(fibonacci(n-k-1)/fibonacci(n-k))*(b(k+1)-a(k+1));
    else
        a(k+1) = a(k);
        b(k+1) = x2(k);
        x2(k+1) = x1(k);
        x1(k+1) = a(k+1)+(fibonacci(n-k-2)/fibonacci(n-k))*(b(k+1)-a(k+1));
    end
    if k == n-2
        x1(n) = x1(n-1);
        x2(n) = x1(n-1)+e;
        if f(x1(n)) > f(x2(n))
            a(n) = x1(n);
            b(n) = b(n-1);
        else
            a(n) = a(n-1);
            b(n) = x1(n);
        end
    end
end
fprintf('---- Fibonacci Method ----\n')
fprintf('The limits which contain the minimum value of f function are [a, b] = [%f, %f]\n',a(k),b(k))
        