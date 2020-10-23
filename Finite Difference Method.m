a1 = 1;
b1 = 2;
alpha = 1;
beta = 2;
N = 4;


p=@(x) -2/x;
q=@(x) 2/(x^2);
r=@(x) sin(log(x))/x^2;

h = (b1 - a1)/(N + 1);
x = a1 + h;
a(1) = 2 + (h^2)*q(x);
b(1) = -1 + (h/2)*p(x);
d(1) = -h^2*r(x) + (1 + (h/2)*p(x))*alpha;

for i = 2: N-1
    %disp(x)
    x = a1 + i*h;
    
    a(i) = 2 + (h^2)*(q(x));
    b(i) = -1 + (h/2)*p(x);
    c(i) = -1 - (h/2)*p(x);
    d(i) = -h^2*r(x);
end

x = b1 - h;
a(N) = 2 + h^2*q(x);
c(N) = -1 - (h/2)*p(x);
d(N) = -h^2*r(x) + (1 - (h/2)*p(x))*beta;


l(1) = a(1);
u(1) = b(1)/a(1);
z(1) = d(1)/l(1);

for i = 2:N-1 
    l(i) = a(i) - c(i)*u(i-1);
    u(i) = b(i)/l(i);
    z(i) = (d(i) - c(i)*z(i-1))/l(i);
end

l(N) = a(N) - c(N)*u(N-1);
z(N) = (d(N) - c(N)*z(N-1))/l(N);

w(1) = alpha;
w(N+1) = beta;
w(N) = z(N);

for i = N-1:-1:1 
    w(i) = z(i) - u(i)*w(i+1);
end

for i = 1:N + 1
    x = a1 + i*h;
    fprintf('  values %d %d ',x, w(i));
end
