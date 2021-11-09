function y = heun(fun,xbar,x0,y0,h)
% Método de Euler Aperfeiçoado
    while x0 <= xbar-h
        y = y0+(h/2)*(fun(x0,y0)+fun(x0+h,y0+h*fun(x0,y0)));
        y0 = y;
        x0 = x0+h;
    end
end
