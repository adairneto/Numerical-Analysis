function [raiz] = bissecao(epsilon)

% Função que calcula, pelo método da bisseção, uma aproximação para o zero.
% Entrada: função f e intervalo que [a, b] que contém a raiz
% Dados: intervalo de tolerância epsilon

f_string = input("Digite a função f(x): ", "s");
f = str2func(['@(x)', f_string]);
a = input("Digite o valor a: ");
b = input("Digite o valor b: ");

% Inicializamos
f_a = f(a);
f_b = f(b);

while (b-a) > (2*epsilon)
    m = (a+b)/2;
    f_m = f(m);
    if sign(f_a)*sign(f_m) < 0
        b = m;
        f_b = f_m;
    else
        a = m;
        f_a = f_m;
    end
end
raiz = (a+b)/2;
end