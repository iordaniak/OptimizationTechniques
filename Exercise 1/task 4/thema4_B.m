clc
clear
l = 0.001:0.001:0.07;

a = -4; b = 4;

n = zeros(length(l),1);
for i = 1:length(l)
    while 0.5^n(i) > l(i)/(b-a)
        n(i) = n(i) + 1;
    end
end

f_calculations = n;
figure(1)
plot(l,f_calculations,'green')
hold on
title('Number of Objective Function f3 calculations')
xlabel('𝑙')
ylabel('Number of function calculations')
