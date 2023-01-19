function y = prog_euler(fun,xbar,x0,y0,h)
    while x0 <= xbar-h
        y = y0+h*fun(x0,y0);
        y0 = y;
        x0 = x0+h;
    end
end