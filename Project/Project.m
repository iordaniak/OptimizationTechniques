syms f(u1,u2)
f(u1,u2) = sin(u1+u2) * sin(u2^2);

u1_limits = [-1, 2];
u2_limits = [-2, 1];

% -----------------------------------------------------------------
p = 100;    % population size
c = 30;    % number of pair of chromosomes to be crossovered
m = 30;    % number of chromosomes to be mutated
ng = 1000;  % number of generations
% -----------------------------------------------------------------

% Data sampling 
X = zeros(256,2);
for i = 1:16:256
    X(i:i+15,1) = linspace(-1,2,16);
end
temp = 1;
for i = 0:15
    X(i+temp:temp+15+i,2) = -2 + i*(0.2);
    temp = temp + 15;
end
y_test = zeros(256,1);
for i = 1:256
    y_test(i,1) = f(X(i,1),X(i,2));
end

% Random population of chromosomes - solutions
P = population(p);

% Crossover -> Mutation -> new Popoulation -> Evaluation -> Selection
for i=1:ng
    Cr = crossover(P,c);
    Mu = mutation(P,m);
    P(p+1:p+2*c,:) = Cr;
    P(p+2*c+1:p+2*c+m,:) = Mu;
    E = evaluation(P,X,y_test);
    P = selection(P,E,p);
end

solution = P(1,:); % best chromosome

a = zeros(15,1); c1 = zeros(15,1); c2 = zeros(15,1);
s1 = zeros(15,1); s2 = zeros(15,1); b = 0;
temp1 = 1; temp2 = 1;
for i = 1:15
    % decoding
    a(i) = bi2de(P(1,temp1:(temp1+4)),'left-msb');
    c1(i) = bi2de(P(1,(temp1+75):(temp1+75+4)),'left-msb');
    c2(i) = bi2de(P(1,(temp1+150):(temp1+150+4)),'left-msb');
    s1(i) = bi2de(P(1,(temp2+225):(temp2+225+2)),'left-msb');
    s2(i) = bi2de(P(1,(temp2+270):(temp2+270+2)),'left-msb');
    temp1 = temp1 + 5;
    temp2 = temp2 + 3;
        
    % scaling
    a(i) = (a(i)/10) - 1.5;
    c1(i) = (c1(i)/10) - 1;
    c2(i) = (c2(i)/10) - 2;
    s1(i) = (s1(i)/10) + 0.1;
    s2(i) = (s2(i)/10) + 0.1;       
end

% Plots
figure(1)
f1 = @(x,y) sin(x+y)*sin(y^2);
fsurf(f1,[-1 2 -2 1])
title('Function surface plot')
xlabel('u1')
ylabel('u2')

figure(2)
f_p = @(u1,u2) a(1)*exp(-((u1-c1(1))^2/(2*s1(1)^2)+(u2-c2(1))^2/(2*s2(1)^2))) + a(2)*exp(-((u1-c1(2))^2/(2*s1(2)^2)+(u2-c2(2))^2/(2*s2(2)^2))) + a(3)*exp(-((u1-c1(3))^2/(2*s1(3)^2)+(u2-c2(3))^2/(2*s2(3)^2))) + a(4)*exp(-((u1-c1(4))^2/(2*s1(4)^2)+(u2-c2(4))^2/(2*s2(4)^2))) +a(5)*exp(-((u1-c1(5))^2/(2*s1(5)^2)+(u2-c2(5))^2/(2*s2(5)^2))) + a(6)*exp(-((u1-c1(6))^2/(2*s1(6)^2)+(u2-c2(6))^2/(2*s2(6)^2))) + a(7)*exp(-((u1-c1(7))^2/(2*s1(7)^2)+(u2-c2(7))^2/(2*s2(7)^2))) + a(8)*exp(-((u1-c1(8))^2/(2*s1(8)^2)+(u2-c2(8))^2/(2*s2(8)^2))) + a(9)*exp(-((u1-c1(9))^2/(2*s1(9)^2)+(u2-c2(9))^2/(2*s2(9)^2))) + a(10)*exp(-((u1-c1(10))^2/(2*s1(10)^2)+(u2-c2(10))^2/(2*s2(10)^2))) + a(11)*exp(-((u1-c1(11))^2/(2*s1(11)^2)+(u2-c2(11))^2/(2*s2(11)^2))) + a(12)*exp(-((u1-c1(12))^2/(2*s1(12)^2)+(u2-c2(12))^2/(2*s2(12)^2))) + a(13)*exp(-((u1-c1(13))^2/(2*s1(13)^2)+(u2-c2(13))^2/(2*s2(13)^2))) + a(14)*exp(-((u1-c1(14))^2/(2*s1(14)^2)+(u2-c2(14))^2/(2*s2(14)^2))) + a(15)*exp(-((u1-c1(15))^2/(2*s1(15)^2)+(u2-c2(15))^2/(2*s2(15)^2)));
fsurf(f_p,[-1 2 -2 1])
title('Estimation surface plot')
xlabel('u1')
ylabel('u2')

% Generare sound when program stops
sound(sin(1:1000))

