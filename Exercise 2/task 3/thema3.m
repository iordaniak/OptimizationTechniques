clear

syms x y
f(x,y) = x^3 * exp(-x^2-y^4);
delta_f = jacobian(f,[x,y]);
delta2_f = hessian(f,[x,y]);

X = zeros(100,2);
d = zeros(100,2);

e = 0.001;
gamma = 0.5;
X0 = [0,0; -1,-1; 1,1;]; 

for i = 1:3
    k = 1;
    X(k,:) = X0(i,:);
    f_values = zeros(100,1);
    while norm(double(subs(delta_f,[x,y],X(k,:)))) >= e
        h = double(subs(delta2_f,[x,y],X(k,:)));
        if h(1,1)<0 || h(1,1)*h(2,2)-h(1,2)*h(2,1)<0
            disp('The hessian is not positive definite - Error')
            break
        end
        f_values(k) = f(X(k,1),X(k,2));
        d(k,:) = -inv(h) * (double(subs(delta_f,[x,y],X(k,:)))).';
        X(k+1,:) = X(k,:) + gamma * d(k,:);
        k = k + 1;
    end
    
    % Plots and Prints
    fprintf('\n x0 = (%d,%d) ----> xk = (%f, %f)\n',X0(i,1),X0(i,2),X(k,1),X(k,2));
    figure(i)
    kplot = 1:(k-1);
    plot(kplot,f_values(1:(k-1)))
    title(['Newton for gamma=',num2str(gamma), ' and x0=( ',num2str(X0(i,1)),', ',num2str(X0(i,2)),' )'])
    xlabel('k')
    ylabel('f(x,y)')
end