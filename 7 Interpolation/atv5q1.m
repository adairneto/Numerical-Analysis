% PRIMEIRO ITEM: POLINÔMIO

% Dados Iniciais
xs = [-2, -1, 0, 1, 2, 3, 4];
ys = [6.5, 0.6, -1.4, 0.7, 6.8, 16.7, 30.6];
n = length(xs);

% Escolha do grau
diftab = divdiff(xs,ys,n); % Gera abela de diferenças divididas
fprintf("Tabela de diferenças divididas: \n");
display(diftab);

% Escolha dos pontos
xs = [0, 1, 2];
ys = [-1.4, 0.7, 6.8];
n = length(xs);
diftab2 = divdiff(xs,ys,n);

% Aproximação
f1 = @(x) ys(1) + (x-xs(1))*diftab2(2,2); % Polinômio de grau 1
f2 = @(x) f1(x) + (x-xs(1))*(x-xs(2))*diftab2(3,3); % Polinômio de grau 2
p2 = f2(1.5);
fprintf("Aproximação por polinômio interpolador para x=1.5: %f\n", p2);

% Estimativa do erro
M1 = max(max(abs(diftab(3:5,4))));
error = @(x) abs((x-xs(1))*(x-xs(2))*(x-xs(3)))*M1;
est_erro = error(1.5);
fprintf("Estimativa do erro para polinômio interpolador: %f\n", est_erro);

% SEGUNDO ITEM: SPLINE

% Dados Iniciais
xs = [-2, -1, 0, 1, 2, 3, 4];
ys = [6.5, 0.6, -1.4, 0.7, 6.8, 16.7, 30.6];

% Splines interpoladoras
s1 = @(x) ys(1)*(xs(2)-x)/(xs(2)-xs(1)) + ys(2)*(x-xs(1))/(xs(2)-xs(1));
s2 = @(x) ys(2)*(xs(3)-x)/(xs(3)-xs(2)) + ys(3)*(x-xs(2))/(xs(3)-xs(2));
s3 = @(x) ys(3)*(xs(4)-x)/(xs(4)-xs(3)) + ys(4)*(x-xs(3))/(xs(4)-xs(3));
s4 = @(x) ys(4)*(xs(5)-x)/(xs(5)-xs(4)) + ys(5)*(x-xs(4))/(xs(5)-xs(4));
s5 = @(x) ys(5)*(xs(6)-x)/(xs(6)-xs(5)) + ys(6)*(x-xs(5))/(xs(6)-xs(5));
s6 = @(x) ys(6)*(xs(7)-x)/(xs(7)-xs(6)) + ys(7)*(x-xs(6))/(xs(7)-xs(6));

% Aproximação
fprintf("Aproximação por spline para x=1.5: %f\n", s4(1.5));

% Estimativa do erro
h = xs(5)-xs(4);
M2 = 2*max(max(abs(diftab(3:5,3))));
erroaprox = (M2*h^2)/8;
fprintf("Estimativa do erro para spline: %f\n", erroaprox);

% Plot
f = @(x) -1.4 + (x-0)*(2.1) + (x-0)*(x-1)*2;
plot(xs,ys,'o');
hold on;
grid on;
fplot(f,[-2,4], 'k');
fplot(s1,[-2,-1], 'r');
fplot(s2,[-1,0], 'r');
fplot(s3,[0,1], 'r');
fplot(s4,[1,2], 'r');
fplot(s5,[2,3], 'r');
fplot(s6,[3,4], 'r');
title("Comparação dos modelos");
legend('Dados Iniciais','Interpolação',"Spline")
hold off;

% FUNÇÕES

function diftab = divdiff(xs,ys,n)
diftab = zeros(n);
for i=1:n
    for j=1:n
        if j <= i
            diftab(i,j) = divaux(xs,ys,i-j+1,i);
        end
    end
end
end

function dif = divaux(xs,ys,s,f)
if s==f || s>f
    dif = ys(s);
else
    dif = (divaux(xs,ys,s+1,f)-divaux(xs,ys,s,f-1))/(xs(f)-xs(s));
end
end