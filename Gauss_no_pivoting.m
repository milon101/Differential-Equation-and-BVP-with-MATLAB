function x = Gauss_no_pivoting(A, b)

[n, n] = size(A);     
[n, k] = size(b);     
x = zeros(n,k);      
for i = 1:n-1
    m = -A(i+1:n,i)/A(i,i); 
    A(i+1:n,:) = A(i+1:n,:) + m*A(i,:);
    b(i+1:n,:) = b(i+1:n,:) + m*b(i,:);
end;

x(n,:) = b(n,:)/A(n,n);
for i = n-1:-1:1
    x(i,:) = (b(i,:) - A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end
 