function [X] = projection(temp)
    
    % The limits of the restrictions for the 2 variables x,y
    x_lower = -15;
    x_upper = 15;
    y_lower = -20;
    y_upper = 12;
    
    if temp(1) <= x_lower
        X(1) = x_lower;
    elseif temp(1) >= x_upper
        X(1) = x_upper;
    else
        X(1) = temp(1);
    end
    if temp(2) <= y_lower
        X(2) = y_lower;
    elseif temp(2) >= y_upper
        X(2) = y_upper;
    else
        X(2) = temp(2);
    end
end

