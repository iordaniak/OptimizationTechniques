clear
clc
l = [0.005, 0.01, 0.2];

e = 0.001;
a = zeros(100,3);
b = zeros(100,3);
a(1,:) = [-4, -4, -4]; b(1,:) = [4, 4, 4];

% Choose a function by removing its '%' and by placing it on the other 2
%f = @(x) (x-3)^2 + (sin(x+3))^2;
%f = @(x) (x-1) * cos(x/2) + x^2;
f = @(x) (x+2)^2 + exp(x-2) * sin(x+3);

x1 = zeros(100,3);
x2 = zeros(100,3);
k = zeros(1,3);
for i=1:3
    k(i) = 1;
    while b(k(i),i)-a(k(i),i) >= l(i)
        x1(k(i),i) = (a(k(i),i)+b(k(i),i))/2 - e;
        x2(k(i),i) = (a(k(i),i)+b(k(i),i))/2 + e;
        if f(x1(k(i),i)) < f(x2(k(i),i))
            a(k(i)+1,i) = a(k(i),i);
            b(k(i)+1,i) = x2(k(i),i);
        else
            a(k(i)+1,i) = x1(k(i),i);
            b(k(i)+1,i) = b(k(i),i);
        end
        k(i) = k(i) + 1;
    end
end
K1 = (1:1:k(1))';
K2 = (1:1:k(2))';
K3 = (1:1:k(3))';
figure(1)
plot(K1,a(1:k(1),1))
hold on
plot(K1,b(1:k(1),1))
plot(K2,a(1:k(2),1))
plot(K2,b(1:k(2),1))
plot(K3,a(1:k(3),1))
plot(K3,b(1:k(3),1))
xlabel('k')
ylabel(' [ak, bk]');
legend({'a , 𝑙=0.005','b , 𝑙=0.005','a , 𝑙=0.01','b , 𝑙=0.01','a , 𝑙=0.2','b , 𝑙=0.2'}, 'Location', 'northeast')
title('Boundaries [a, b] that contain the minimum value of f3')