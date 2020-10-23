function rk2_ode
f=inline('-x^2+y') % the right side of ODE
h=0.1;
x0=0; % intial argument
y0=-1; %initial value y(x0)
xn=1; % terminal argument
x=x0:h:xn;
y(numel(x))=0; %memory allocation
y(1)=y0;
for i=1:numel(x)-1 
  k=ss(f, h, x(i), y(i));
  y(i+1)=y(i)+1/2*h*(k(1)+k(2));
end
disp([x',y'])
plot(x,y)
function solution=ss(f,h,x,y)
  s=sqrt(3);
  t1=(s-1)/(2*s);
  t2=(s-2)/(4*s);
  t3=(s+1)/(2*s);
  t4=(s+2)/(4*s);
  F=@(k) [f(x+t1*h, y+(h/4)*k(1)+t2*h*k(2))-k(1);
  f(x+t3*h, y+t4*h*k(1)+h/4*k(2))-k(2)];   
  initial_guess=[1;1];
  [solution]=fsolve(F, initial_guess);