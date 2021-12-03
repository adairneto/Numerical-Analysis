% Entries:
% a = x0
% b = xn
% n = number of steps

a = 0;
b = 1;
f = @(x) exp(x);
df = @(x) exp(x);
ddf = @(x) exp(x);
dddf = @(x) exp(x);
ddddf = @(x) exp(x);
n = 10;
h = (b-a)/n; % Step

I_t = ((b-a)/2) * (f(a) + f(b)); % Trapezium Formula
I_s = ((b-a)/6) * (f(a) + 4*f((a+b)/2) + f(b)); % Simpson's Formula
[I_sr,diffs_sr] = repeated_simpson(f,a,n,h,ddddf); 
[I_tr,diffs_tr] = repeated_trapezium(f,a,n,h,ddf);

% Error
M_sr = max(abs(diffs_sr));
error_sr = ((b-a)/180)*h^4*M_sr;
M_tr = max(abs(diffs_tr));
error_tr = ((b-a)/12)*h^2*M_tr;

% Repeated Simpson
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

% Repeated Trapezium
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

% Lagrange Formula (given i)
function prod = lagrange_formula(xs,i)
    prod = 1;
    for k=0:n
      if k ~= i
        prod = prod * (x-xs(k))/(xs(i)-xs(k));
      end
    end
end
