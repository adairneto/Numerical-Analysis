function x = gauss_seidel(A,b,x)

% Initialization
[row, column] = size(A);
k = 0;
epsilon = 10^(-4);
error = epsilon + 1;
x0 = x;

while error > epsilon
    for k=1:row
         for i=1:row
             x(i,:) = b(i,:);
             for j=1:(i-1)
                 x(i,:) = x(i,:) - A(i,j)*x(j,:);
             end
             for j=(i+1):column
                 x(i,:) = x(i,:) - A(i,j)*x(j,:);
             end
             x(i,:) = x(i,:)/A(i,i);
         end
    end
    error = norm(x-x0,Inf)/norm(x,Inf);
    x0 = x;
end
return