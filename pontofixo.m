function [raiz, counter] = ms211pontofixo(epsilon)

% Função que calcula, pelo método do ponto fixo, uma aproximação para o zero de uma dada função.
% Entrada: função phi e aproximação inicial x_0
% Dados: número máx de iterações e intervalo de tolerância delta

f_string = input("Digite a função f(x): ", "s");
phi = str2func(['@(x)', f_string]);
x_0 = input("Digite o valor x_0: ");

% Inicializamos
k = 0;
error = epsilon + 1;
counter = 0;

if abs(phi(x_0)) < epsilon
    raiz = x_0;
else
    while (abs(phi(x_0)) >= epsilon) && (abs(error) >= epsilon) && (counter < 20)
        counter = counter + 1;
        k = k+1;
        x = phi(x_0);
        error = abs(x - x_0);
        x_0 = x;
        % fprintf("Iteração: %d - Raiz: %1.5f\n", counter, x);
        fprintf("Iteração: | %d | - Raiz: | %1.7f | - abs(x - x_0): | %1.7f | \n", counter, x, error);
    end
end
raiz = x;
end