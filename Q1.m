x = linspace(-1,1);
y1 = x+3;
y2 = x.^2+1;
y3 = y1.*y2;
y4 = y1./y2;

figure
plot(x,y1,x,y2,x,y3,x,y4)