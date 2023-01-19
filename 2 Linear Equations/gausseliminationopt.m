function [L,U,b,x] = gausseliminationopt(A, b, n)

% Processo de eliminação
for k=1:n-1
    for i = k+1:n
        m = A(i,k) / A(k,k);
        A(i,k) = m;
        b(i, :) = b(i, :) - m * b(k, :);
        for j=k+1:n
            A(i,j) = A(i,j) - m * A(k,j);
        end  
    end
end

L = eye(n);
U = zeros(n);

% Monta as matrizes U e L
for i=1:n
   for j=1:n
       if j<i
           L(i,j) = A(i,j);
       else
           U(i,j) = A(i,j);
       end
   end
end

x = backsubstitution(U, b, n); 

end