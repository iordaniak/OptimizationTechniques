clc
clear
l = 0.001:0.001:0.07;

a = -4; b = 4;
n = zeros(length(l),1);
for i = 1:length(l)
    while (b-a)/fibonacci(n(i)) >= l(i)
        n(i) = n(i) + 1;
    end
end
f_calculations = 2 * (n-2)+2;
figure(1)
plot(l,f_calculations,'blue')
hold on
title('Number of Objective Function f1 calculations')
xlabel('𝑙')
ylabel('Number of function calculations')
