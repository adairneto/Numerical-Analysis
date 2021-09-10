function [raiz, counter] = ms211secante(epsilon)

% Função que calcula, pelo método da secante, uma aproximação para o zero.
% Entrada: função f e aproximações iniciais x_0 e x_1
% Dados: intervalo de tolerância epsilon

f_string = input("Digite a função f(x): ", "s");
f = str2func(['@(x)', f_string]);
x_0 = input("Digite o valor x_0: ");
x_1 = input("Digite o valor x_1: ");

% Inicializamos
f_0 = f(x_0);
f_1 = f(x_1);
error = epsilon + 1;
counter = 0;

% Iterações
if abs(f_0) < epsilon
    raiz = x_0;
elseif (abs(f_1) < epsilon || abs(x_1-x_0) < epsilon)
    raiz = x_1;
else
    while (abs(f_1) >= epsilon && (abs(error) >= epsilon))
        counter = counter + 1;
        x = (x_0 * f_1 - x_1 * f_0)/(f_1 - f_0);
        error = abs(x - x_1);
        x_0 = x_1;
        f_0 = f_1;
        x_1 = x;
        f_1 = f(x);
        fprintf("Iteração: %d - x_0: | %1.7f | - x_1: | %1.7f | - |x - x_1|: | %1.7f | - x: | %1.7f | - f(x): | %1.7f | \n", counter, x_0, x_1, abs(error), x, f_1);
    end
    raiz = x;
end
end