clc;

f1=@(x,y,z) (1/20)*(17-y+2*z);
f2=@(x,y,z) (1/20)*(-18-3*x+z);
f3=@(x,y,z) (1/20)*(25-2*x+3*y);


x=0; y=0; z=0; 
for i=1:5
    f1(x,y,z);
    f2(x,y,z);
    f3(x,y,z); 
    a=f1(x,y,z); 
    b=f2(x,y,z); 
    c=f3(x,y,z);
    x=a; y=b; z=c;
end
x
y
z