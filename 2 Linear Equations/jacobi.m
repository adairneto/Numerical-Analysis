function x0 = jacobi(A, b, x0, epsilon)

[row, column] = size(A);
k = 0;
error = epsilon + 1;
D = diag(A) .* eye(row);
M = A-D;

while error > epsilon
   k = k+1;
   % x = D\(b-(M*x0));
   for i=1:row
       x(i,:) = b(i,:);
       for j=1:(i-1)
           x(i,:) = x(i,:) - A(i,j)*x0(j,:);
       end
       for j=(i+1):column
           x(i,:) = x(i,:) - A(i,j)*x0(j,:);
       end
       x(i,:) = x(i,:)/A(i,i);
   end   
   error = norm(x-x0,Inf)/norm(x,Inf);
   x0 = x;
end
end