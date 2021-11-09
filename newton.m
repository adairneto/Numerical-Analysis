function [raiz] = newton(delta, epsilon)

% Função que calcula, pelo método de Newton, uma aproximação para o zero de uma dada função.
% Entrada: função f e aproximação inicial x_0
% Dados: número máx de iterações e intervalos de tolerância delta e epsilon

f_string = input("Digite a função f(x): ", "s");
f = str2func(['@(x)', f_string]);
df_string = input("Digite a função f'(x): ", "s");
df = str2func(['@(x)', df_string]);
x_0 = input("Digite o valor x_0: ");
k_max = input("Valor máximo de iterações: ");

% Inicializamos
k = 0;
f_0 = f(x_0);
Dr = delta + 1;
 
while ((k <= k_max) && ((abs(f_0) > epsilon) || (Dr > delta)))
    k = k+1;
    x = x_0 - f_0/df(x_0);
    Dr = abs(x - x_0);
    x_0 = x;
    f_0 = f(x_0);
end

if k>k_max
    fprintf("Número máximo de iterações alcançado!");
else
    raiz = x;
end

end