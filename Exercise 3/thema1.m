clear
 
% delta_f is the name of the gradient of f
syms x y
f(x,y) = (1/2)*x^2 + 2*y^2;
delta_f = jacobian(f,[x,y]);

X = zeros(10000,2);
d = zeros(10000,2);
f_values = zeros(10000,1);

e = 0.01;
gamma = 0.05;
X0 = [10,-5]; 

k = 1;
X(k,:) = X0;    
while norm(double(subs(delta_f,[x,y],X(k,:)))) >= e
    f_values(k) = f(X(k,1),X(k,2));
    d(k,:) = -double(subs(delta_f,[x,y],X(k,:)));
    X(k+1,:) = X(k,:) + gamma * d(k,:);
    k = k + 1;
end
    
% Plots and Prints
fprintf('\n x0 = (%d,%d) ----> xk = (%f, %f)\n',X0(1),X0(2),X(k,1),X(k,2));
figure(1)
kplot = 1:(k-1);
plot(kplot,f_values(1:(k-1)))
title(['Steepest Descent for gamma=',num2str(gamma), ' and x0=( ',num2str(X0(1)),', ',num2str(X0(2)),' )'])
xlabel('k')
ylabel('f(x,y)')
