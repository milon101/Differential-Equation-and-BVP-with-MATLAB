function RungeKuttaMethod

%y' = y - t^2 + 1. 
a = 0;                 
b = 2;
N = 10;               
t = zeros(1, N);        
w = zeros(1, N);
w(1) = 0.5;             
h = (b - a)/N;          
t(1) = a;              

F =  @(t, y) y - t^2 + 1;   

for i = 1:(N-1)
    
K1 = h*(F(t(i), w(i)));                         
K2 = h*(F(t(i) + 0.5*h, w(i) + 0.5*K1));
K3 = h*(F(t(i) + 0.5*h, w(i) + 0.5*K2));
K4 = h*(F(t(i) + h, w(i) + K3));
w(i+1) = w(i) + (K1 + 2*K2 + 2*K3 + K4)/6;      
t(i+1) = a + i*h;
fprintf('%d  %d\n', t(i+1),w(i+1))
end

%Fa = (t+1).^2 -0.5*exp(t); %actualy solution we ca use to compare between both methods%
plot(t, w)
%hold on                %use these 3 lines to see both solutions plotted on
%plot(t, Fa, 'r')       %same graph for comparison.
%hold off

end
