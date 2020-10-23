function Euler
clear t 
clear y 
a=0;
b=2; 
N=10; 
y0=0.5; 
h=(b-a)/N; 
t(1)=a;
y(1)=y0;

f=@(t, y) 1-t^2+y;

for n=1:N 
    t(n+1)=t(n)+h;
    y(n+1)=y(n)+h*f(t(n),y(n)); 
    fprintf('%d  %d\n', t(n+1),y(n+1))
end

plot(t,y)
title(['Euler Method using N=',num2str(N),' steps'])

