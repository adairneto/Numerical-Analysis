function y = crank_nicolson(fun,xbar,x0,y0,h)
    epsilon = 0.0001;
    while x0 <= xbar-h
        phi = @(y) y0 + h/2 * (fun(x0,y0) + fun(x0+h,y));
        y = pontofixo2(phi, x0+h, epsilon);
        y0 = y;
        x0 = x0+h;
    end
end