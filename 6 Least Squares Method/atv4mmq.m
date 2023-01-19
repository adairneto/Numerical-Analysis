% Dados do problema
xs = [-2, -1, 0, 1, 2, 3, 4, 5];
ys = [-64, -27.5, -9.3, -2.2, -0.5, 0.2, 7.1, 27];
% plot(xs,ys,'.');

% Modelo
% Ver função g no final do arquivo

% Montando a matriz A
for i=1:4
    for j=1:4
        soma = 0;
        for k=1:8
            soma = soma + g(i,xs(k))*g(j,xs(k));
        end
        A(i,j) = soma;
    end
end

% Montando a matriz b
for i=1:4
    soma = 0;
    for k=1:8
        soma = soma + g(i,xs(k))*ys(k);
    end
    b(i) = soma;
    b = b.';
end

% Resolvendo o sistema
sol = gausseliminationpivot(A, b, 4);

% Aproximação xbar para x = 0.5
phi = @(x) sol(1)*1 + sol(2)*x + sol(3)*x^2 + sol(4)*x^3;
xbar = phi(0.5);
fprintf("Solução aproximada: %f\n", xbar);

% Plotando a solução com os pontos dados
plot(xs,ys,'x');
hold on;
fplot(phi,[-2,5]);
hold off;

% Modelo
function out = g(n,x)
    out = x^(n-1);
end

% Método de Eliminação de Gauss com pivoteamento
function x = gausseliminationpivot(A, b, n)
    for k=1:n-1
        
        % Finds the pivot
        max = abs(A(k,k));
        maxv = k;
        for i=k+1:n
            if abs(A(i,k)) > max
                max = abs(A(i,k));
                maxv = i;
            end
        end
        % fprintf("Pivot: %f\n", max); 
        
        % Exchanges
        mem = A(k,:);
        A(k,:) = A(maxv,:);
        A(maxv,:) = mem;
        mem = b(k,:);
        b(k,:) = b(maxv,:);
        b(maxv,:) = mem;
        % fprintf("New matrix: \n");
        % disp(A);
        % fprintf("\nNew b: \n");
        % disp(b);
        
        % Gauss elimination procedure
        for i = k+1:n
            m = A(i,k) / A(k,k);
            A(i,k) = m;
            b(i, :) = b(i, :) - m * b(k, :);
            for j=k+1:n
                A(i,j) = A(i,j) - m * A(k,j);
            end  
        end
    end
    x = backsubstitution(A, b, n);
end

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