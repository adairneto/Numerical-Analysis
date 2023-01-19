function solution = backsubstitution(A, b, n)

x(n) = b(n)/A(n,n);
k = n;

while k>1
    k = k-1;
    soma = b(k);
    j = k;
    while j<n
        j = j+1;
        soma = soma - A(k,j)*x(j);
    end
    x(k) = soma/A(k,k);
end
solution = x;
end