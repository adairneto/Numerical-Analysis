% Matriz A
fprintf("Vamos digitar a matriz A.\n");
for i=1:4
    for j=1:4
        A(i,j)=input(sprintf('Entrada A(%d,%d): ', i, j));
    end
end

% Vetor b
fprintf("Agora vamos digitar o vetor b.\n");
for i=1:4
    b(i)=input(sprintf('Entrada %d: ', i));
end

% Resolução
x = gauss_seidel(A,b.',[0;0;0;0]);
disp(x);