% Initial data
xs = [-1,0,1,2,3,4,5];
ys = [-1, -1.8, -1, 1.9, 7.2, 14.5, 22];
a = -1;
b = 5;
n = length(xs);
h = 1;

% Solution
I_ds = discrete_simpson(ys,n,h);
I_dt = discrete_trapezium(ys,n,h);

% Error
diftab = divdiff(xs,ys,n); % Gera a tabela de diferenças divididas
M_ds = 24*max(max(abs(diftab(:,5))));
error_ds = ((b-a)/180)*h^4*M_ds;
M_dt = 2*max(max(abs(diftab(:,3))));
error_dt = ((b-a)/12)*h^2*M_dt;

% Results
fprintf("Aproximação utilizando o método discreto de Simpson: %f\n", I_ds);
fprintf("Aproximação utilizando o método discreto dos Trapézios: %f\n", I_dt);
fprintf("Estimativa do erro utilizando o método discreto de Simpson: %f\n", error_ds);
fprintf("Estimativa do erro utilizando o método discreto dos Trapézios: %f\n", error_dt);

% Discrete Simpson
function I_ds = discrete_simpson(ys,n,h)
    I_ds = 0;
    for i=1:2:n-1
        I_ds = I_ds + (h/3) * ((ys(i))+4*ys(i+1)+ys(i+2));
    end
end

% Discrete Trapezium
function I_dt = discrete_trapezium(ys,n,h)
    I_dt = ys(1) + ys(n);
    for i=2:n-1
        I_dt = I_dt + 2*(ys(i));
    end
    I_dt = (h/2)*I_dt;
end

% Table of divided differences
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

% Auxiliar function for divided differences
function dif = divaux(xs,ys,s,f)
if s==f || s>f
    dif = ys(s);
else
    dif = (divaux(xs,ys,s+1,f)-divaux(xs,ys,s,f-1))/(xs(f)-xs(s));
end
end