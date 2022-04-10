syms x y
f= x^3 * exp(-x^2-y^4);

[x1,y1] = meshgrid(-5:0.1:5,-5:0.1:5);
z1 = (x1.^3).*exp(-x1.^2-y1.^4);

figure(1)
surf(x1,y1,z1);
figure (2)
z = fcontour(f);


