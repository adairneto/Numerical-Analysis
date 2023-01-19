% PRIMEIRO ITEM

% Dados iniciais
f = @(x) 2*x*sin(x^2); % Função a ser integrada
df = @(x) 2*sin(x^2) + 4*x^2*cos(x^2); % Primeira derivada
ddf = @(x) 12*x*cos(x^2) - 8*x^3*sin(x^2); % Segunda derivada
dddf = @(x) 12*cos(x^2) - 16*x^4*cos(x^2) - 48*x^2*sin(x^2); % Terceira derivada
ddddf = @(x) 32*x^5*sin(x^2) - 160*x^3*cos(x^2) - 120*x*sin(x^2); % Quarta derivada
a = -1; % Limite inferior de integração
b = 2; % Limite superior
n = 20; % Escolha
h = (b-a)/n; % Step

% Aproximação
[I_sr,diffs_sr] = repeated_simpson(f,a,n,h,ddddf); 
[I_tr,diffs_tr] = repeated_trapezium(f,a,n,h,ddf);

% Estimativa do erro
M_sr = max(abs(diffs_sr));
error_sr = ((b-a)/180)*h^4*M_sr;
M_tr = max(abs(diffs_tr));
error_tr = ((b-a)/12)*h^2*M_tr;

% Impressão
fprintf("---------Primeiro item---------\n");
fprintf("Aproximação utilizando o método de Simpson: %f\n", I_sr);
fprintf("Aproximação utilizando o método dos Trapézios: %f\n", I_tr);
fprintf("Estimativa do erro utilizando o método de Simpson: %f\n", error_sr);
fprintf("Estimativa do erro utilizando o método dos Trapézios: %f\n", error_tr);
% Solução analítica: 1.1939

% SEGUNDO ITEM

% Dados iniciais
xs = [-2, -1, 0, 1, 2];
ys = [6.5, 0.6, -1.4, 0.7, 6.8];
a = -2;
b = 2;
n = length(xs);
h = 1;

% Aproximação
I_ds = discrete_simpson(ys,5,h); % int retorna 5,0667
I_dt = discrete_trapezium(ys,5,h); % trapz retorna 6,5500

% Estimativa do erro
diftab = divdiff(xs,ys,n); % Gera a tabela de diferenças divididas
M_ds = 24*max(max(abs(diftab(:,5))));
error_ds = ((b-a)/180)*h^4*M_ds;
M_dt = 2*max(max(abs(diftab(:,3))));
error_dt = ((b-a)/12)*h^2*M_dt;

% Impressão
fprintf("---------Segundo item---------\n");
fprintf("Aproximação utilizando o método discreto de Simpson: %f\n", I_ds);
fprintf("Aproximação utilizando o método discreto dos Trapézios: %f\n", I_dt);
fprintf("Estimativa do erro utilizando o método discreto de Simpson: %f\n", error_ds);
fprintf("Estimativa do erro utilizando o método discreto dos Trapézios: %f\n", error_dt);

% FUNÇÕES

% Simpson
function [I_sr,diffs] = repeated_simpson(f,a,n,h,ddddf)
    mesh = zeros(1,n);
    diffs = zeros(1,n);
    for i=1:n+1
        mesh(i) = a+(i-1)*h;
        diffs(i) = ddddf(mesh(i));
    end
    I_sr = 0;
    for i=1:2:n-1
        I_sr = I_sr + (h/3) * (f(mesh(i))+4*f(mesh(i+1))+f(mesh(i+2)));
    end
end

% Trapézios
function [I_tr,diffs] = repeated_trapezium(f,a,n,h,ddf)
    mesh = zeros(1,n);
    diffs = zeros(1,n);
    for i=1:n+1
        mesh(i) = a+(i-1)*h;
        diffs(i) = ddf(mesh(i));
    end
    I_tr = f(mesh(1)) + f(mesh(n+1));
    for i=2:n
        I_tr = I_tr + 2*(f(mesh(i)));
    end
    I_tr = (h/2)*I_tr;
end

% Simpson Discreto
function I_ds = discrete_simpson(ys,n,h)
    I_ds = 0;
    for i=1:2:n-1
        I_ds = I_ds + (h/3) * ((ys(i))+4*ys(i+1)+ys(i+2));
    end
end

% Trapézio Discreto
function I_dt = discrete_trapezium(ys,n,h)
    I_dt = ys(1) + ys(n);
    for i=2:n-1
        I_dt = I_dt + 2*(ys(i));
    end
    I_dt = (h/2)*I_dt;
end

% Tabela de diferenças divididas 
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

% Função auxiliar para diferenças divididas
function dif = divaux(xs,ys,s,f)
if s==f || s>f
    dif = ys(s);
else
    dif = (divaux(xs,ys,s+1,f)-divaux(xs,ys,s,f-1))/(xs(f)-xs(s));
end
end