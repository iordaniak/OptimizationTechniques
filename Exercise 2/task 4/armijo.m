function [gamma] = armijo(xk,d)
    syms x y
    f(x,y) = x^3 * exp(-x^2-y^4);
    delta_f = jacobian(f,[x,y]);

    s=1; a=0.01; b=0.3;
    m=0;
    gamma = s * b^m;
    delta_xk = double(subs(delta_f,[x,y],xk));
    while f(xk(1),xk(2))-f(xk(1)+gamma*d(1),xk(2)+gamma*d(2)) < (-a*(b^m)*s*d'*delta_xk)
        m = m + 1;
        gamma = s*b^m;
    end
    
end

