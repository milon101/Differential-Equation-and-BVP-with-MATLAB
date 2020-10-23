x = linspace(0,1,200);
g = x.^3 + 1;
h = x + 2;
z = x.^2;
y = cos(3.1416*x);
f = (y.*z)./(g.*h);
disp(f(200))
