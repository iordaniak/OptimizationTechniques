function [gamma_k] = minimize(X_k,d_k)

    % This function will find the minimum value of gamma using the algorith
    % Xrush tomh
    
    f = @(g) (X_k(1)+g*d_k(1))^3 * exp(-(X_k(1)+g*d_k(1))^2-(X_k(2)+g*d_k(2))^4);
    l = 0.01;
    gamma = 0.618;
    a = zeros(100,1);
    b = zeros(100,1);
    a(1) = 0; b(1) = 15;
    
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
    gamma_k = (a(k)+b(k))/2;
end

