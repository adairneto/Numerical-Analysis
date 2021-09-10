function [raiz, counter] = ms211regulafalsi(epsilon)

% Função que calcula, pelo método da falsa posição, uma aproximação para o zero.
% Entrada: função f e intervalo que [a, b] que contém a raiz
% Dados: intervalo de tolerância epsilon

f_string = input("Digite a função f(x): ", "s");
f = str2func(['@(x)', f_string]);
a = input("Digite o valor a: ");
b = input("Digite o valor b: ");

% Inicializamos
f_a = f(a);
f_b = f(b);
f_m = epsilon + 1;
counter = 0;

% while (counter < 14)
while (abs(f_m) > epsilon && abs(b-a) > epsilon)
    counter = counter + 1;
    m = (a*f_b - b*f_a)/(f_b - f_a);
    f_m = f(m);
    if sign(f_a)*sign(f_m) < 0
        b = m;
        f_b = f_m;
    else
        a = m;
        f_a = f_m;
    end
    fprintf("Iteração: %d - a: | %1.7f | - b: | %1.7f | - |b-a|: | %1.7f | - m: | %1.7f | - f(m): | %1.7f | \n", counter, a, b, abs(b-a), m, f_m);
end
raiz = m;
end