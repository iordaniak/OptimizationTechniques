clc
clear
l = [0.005, 0.01, 0.2];

syms x
% Choose a function by removing its '%' and by placing it on the other 2
%f = (x-3)^2 + (sin(x+3))^2;
f = (x-1) * cos(x/2) + x^2;
%f = (x+2)^2 + exp(x-2) * sin(x+3);

f1 = diff(f);

a = zeros(100,3);
b = zeros(100,3);
a(1,:) = [-4, -4, -4]; b(1,:) = [4, 4, 4];

n = zeros(3,1);
for i = 1:3
    while 0.5^n(i) > l(i)/(b(1,1)-a(1,1))
        n(i) = n(i) + 1;
    end
end

X = zeros(100,3);

for i = 1:3
    for k = 1:n(i)
        X(k,i) = (a(k,i)+b(k,i))/2;
        f1_Xk = double(vpa(subs(f1,x,X(k,i))));
        if f1_Xk > 0
            a(k+1,i) = a(k,i);
            b(k+1,i) = X(k,i);
        elseif f1_Xk < 0
            a(k+1,i) = X(k,i);
            b(k+1,i) = b(k,i);
        else
            fprintf('paragogos mhden\n');
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
title('Boundaries [a, b] that contain the minimum value of f2')