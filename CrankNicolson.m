l = 1;
T = 2;
alpha = 1;
m = 10;
N = 50;

h = .1;
k = .01;
lambda = 1;

for i = 1:m
    w(i) = sin(pi*i*h);
end

l(1) = 1 + lambda;
u(1) = -lambda/(2*l(1));

for i = 2:m-2
    l(i) = 1 + lambda + lambda*(u(i-1))/2;
    u(i) = - lambda/(2*l(i));
end    

l(m-1) = 1 + lambda + lambda*u(m-2)/2;

for j=1:N
    t = j*k
    z(1) = [(1-lambda)*w(1) + (lambda/2)*w(2)]/l(1);
    for i = 2:m-1
        z(i) = [(1-lambda)*w(i) + (lambda/2)*(w(i+1) + w(i-1)+z(i-1))]/l(i);
    end
    w(m-1) = z(m-1);
    for i = m-2:-1:1
        w(i) = z(i) - u(i)*w(i+1);
    end
    
    for i =1:m-1
        x = i*h
        fprintf('%d %d',x,w(i))
    end
end
