% Aplicação do método de Crank Nicolson ao problema posto
fun = @(x,y) cos(y^2) + x;
x0 = 1;
y0 = 2;
xbar = 3;
h = 10^(-4);
est = crank_nicolson(fun,xbar,x0,y0,h);
fprintf("Solução aproximada pelo método de Crank Nicolson: %f\n", est);

% Estimativa dos erros no método de Euler Progressivo
erro_progressivo = [];
valor_encontrado = [];
h = [1*10^(-2), 0.5*10^(-2), 0.25*10^(-2), 1*10^(-3)];
n = [];
for iter=1:length(h)
    yk = prog_euler(fun,xbar,x0,y0,h(iter));
    valor_encontrado(end+1) = yk;
    erro = abs(yk-est);
    erro_progressivo(end+1) = erro;
    
    ns = xbar / h(iter);
    n(end+1) = ns;
end
n = n.';
h = h.';
erro_progressivo = erro_progressivo.';
valor_encontrado = valor_encontrado.';
tabela_progressivo = table(n,h,erro_progressivo,valor_encontrado);
fprintf("Tabela: Erros no método de Euler Progressivo");
display(tabela_progressivo);

% Estimativa dos erros no método de Euler Regressivo
erro_regressivo = [];
valor_encontrado_r = [];
h = [1*10^(-2), 0.5*10^(-2), 0.25*10^(-2), 1*10^(-3)];
n = [];
for iter=1:length(h)
    yk = back_euler(fun,xbar,x0,y0,h(iter));
    valor_encontrado_r(end+1) = yk;
    erro = abs(yk-est);
    erro_regressivo(end+1) = erro;
    
    ns = xbar / h(iter);
    n(end+1) = ns;
end
n = n.';
h = h.';
erro_regressivo = erro_regressivo.';
valor_encontrado_r = valor_encontrado_r.';
tabela_regressivo = table(n,h,erro_regressivo,valor_encontrado_r);
fprintf("Tabela: Erros no método de Euler Regressivo");
display(tabela_regressivo);