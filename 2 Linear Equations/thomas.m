function Y = thomas(A,B,N)
% Solves a tridiagonal system using Thomas' method

V = zeros(N,1);
Y = zeros(N,1);
Y(1) = B(1)/A(1,1);
U = A(1,1);

for i=2:N
    V(i-1) = A(i-1,i)/U;
    U = (A(i,i) - A(i,i-1)*V(i-1));
    Y(i) = (B(i) - A(i,i-1)*Y(i-1))/U;
end

for j=N-1:-1:1
    Y(j) = Y(j) - V(j)*Y(j+1);
end
end