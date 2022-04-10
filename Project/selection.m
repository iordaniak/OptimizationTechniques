function [P_new] = selection(P,E,p)
% P - population, E - evaluation , p - population size

[~, y] = size(P);
Y1 = zeros(p,y);

% elite selection
e = 3;
for i = 1:e
    [~,c1] = find(E==min(E));
    Y1(i,:) = P(min(c1),:);
    P(min(c1),:) = [];
    E(:,min(c1)) = [];
end
D = E/sum(E);
E1 = cumsum(D);
N = rand(1);
d1 = 1;
d2 = e;
while d2 <= p-e
    if N <= E1(d1)
        Y1(d2+1,:)=P(d1,:);
        N = rand(1);
        d2 = d2 + 1;
        d1 = 1;
    else
        d1 = d1 + 1;
    end
end
P_new = Y1;
end

