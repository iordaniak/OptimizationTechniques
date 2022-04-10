clc
clear
l = [0.005, 0.01, 0.2];
e = 0.001;

% Choose a function by removing its '%' and by placing it on the other 2
%f = @(x) (x-3)^2 + (sin(x+3))^2;
%f = @(x) (x-1) * cos(x/2) + x^2;
f = @(x) (x+2)^2 + exp(x-2) * sin(x+3);

a = zeros(100,3);
b = zeros(100,3);
a(1,:) = [-4, -4, -4]; b(1,:) = [4, 4, 4];

n = zeros(3,1);
x1 = zeros(100,3);
x2 = zeros(100,3);
for i = 1:3
    while (b(1,1)-a(1,1))/fibonacci(n(i)) >= l(i)
        n(i) = n(i) + 1;
    end
    x1(1,i) = a(1,i)+(fibonacci(n(i)-2)/fibonacci(n(i)))*(b(1,i)-a(1,i));
end


for i = 1:3
    for k = 1:n(i)-2
        if f(x1(k,i)) > f(x2(k,i))
            a(k+1,i) = x1(k,i);
            b(k+1,i) = b(k,i);
            x1(k+1,i) = x2(k,i);
            x2(k+1,i) = a(k+1,i)+(fibonacci(n(i)-k-1)/fibonacci(n(i)-k))*(b(k+1,i)-a(k+1,i));
        else
            a(k+1,i) = a(k,i);
            b(k+1,i) = x2(k,i);
            x2(k+1,i) = x1(k,i);
            x1(k+1,i) = a(k+1,i)+(fibonacci(n(i)-k-2)/fibonacci(n(i)-k))*(b(k+1,i)-a(k+1,i));
        end
        if k == n(i)-2
            x1(n(i),i) = x1(n(i)-1,i);
            x2(n(i),i) = x1(n(i)-1,i)+e;
            if f(x1(n(i),i)) > f(x2(n(i),i))
                a(n(i),i) = x1(n(i),i);
                b(n(i),i) = b(n(i)-1,i);
            else
                a(n(i),i) = a(n(i)-1,i);
                b(n(i),i) = x1(n(i),i);
            end
        end
    end
end

K1 = (1:1:n(1))';
K2 = (1:1:n(2))';
K3 = (1:1:n(3))';
figure(1)
plot(K1,a(1:n(1),1))
hold on
plot(K1,b(1:n(1),1))
plot(K2,a(1:n(2),1))
plot(K2,b(1:n(2),1))
plot(K3,a(1:n(3),1))
plot(K3,b(1:n(3),1))
xlabel('k')
ylabel(' [ak, bk]');
legend({'a , 𝑙=0.005','b , 𝑙=0.005','a , 𝑙=0.01','b , 𝑙=0.01','a , 𝑙=0.2','b , 𝑙=0.2'}, 'Location', 'northeast')
title('Boundaries [a, b] that contain the minimum value of f3')