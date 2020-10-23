function ModifiedEuler
%model: dN/dt = r*(1-N/k)*N
a = 0;         
b = 200;
r = 0.05;       
k = 2;

F = @(N, t) r*(1 - N/k)*N;  

n = 100;            
h = (b - a)/n;   
N(1) = 0.5;         
t(1) = a;          

for i=1:n
N(i+1) = N(i) + h*F(N(i),t(i));         
t(i+1) = a + i*h;                       
N(i+1) = N(i) + 0.5*h*(F(N(i+1), t(i+1)) + F(N(i),t(i))) ;   
fprintf('%d  %d\n', t(i+1),N(i+1))
end

plot(t, N)
