function Y = evaluation(P, u_test, y_test)

[x1, ~] = size(P);
H = zeros(1,x1);
for i = 1:x1
    
    a = zeros(15,1); c1 = zeros(15,1); c2 = zeros(15,1);
    s1 = zeros(15,1); s2 = zeros(15,1); b = 0;
    temp1 = 1; temp2 = 1;
    for j = 1:15
        % decoding
        a(j) = bi2de(P(i,temp1:(temp1+4)),'left-msb');
        c1(j) = bi2de(P(i,(temp1+75):(temp1+75+4)),'left-msb');
        c2(j) = bi2de(P(i,(temp1+150):(temp1+150+4)),'left-msb');
        s1(j) = bi2de(P(i,(temp2+225):(temp2+225+2)),'left-msb');
        s2(j) = bi2de(P(i,(temp2+270):(temp2+270+2)),'left-msb');
        temp1 = temp1 + 5;
        temp2 = temp2 + 3;
        
        % scaling
        a(j) = (a(j)/10) - 1.5;
        c1(j) = (c1(j)/10) - 1;
        c2(j) = (c2(j)/10) - 2;
        s1(j) = (s1(j)/10) + 0.1;
        s2(j) = (s2(j)/10) + 0.1;
        
    end
    b = bi2de(P(i,316:320),'left-msb');
    b = (b/10) - 1.5;
    const = [c1 c2 s1 s2];
    
    % evaluation
    y_hat = zeros(length(y_test),1);
    for k = 1:length(y_test)
        y_hat(k) = f_hat(a,b,const,u_test(k,1),u_test(k,2));
    end
    H(1,i) = immse(y_test,y_hat);
end
Y = H;
end

