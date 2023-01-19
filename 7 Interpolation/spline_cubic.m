% Natural Spline Solver

xs = [0, 0.5, 1.0, 1.5, 2.0];
ys = [3, 1.8616, -0.5571, -4.1987, -9.0536];
len = length(xs);
n = len-1;
A = zeros(n-1,n-1);
y = zeros(n-1,1);

for i=1:n-1
    h1 = xs(i+1)-xs(i);  
    h2 = xs(i+2)-xs(i+1);
    for j=1:n-1
        if j == i-1
            A(i,j) = h1;
        elseif i == j
            A(i,i) = 2*(h1+h2);
        elseif j == i+1
            A(i,j) = h2;
        end
    end
    y(i) = 6*(((ys(i+2)-ys(i+1))/h2) - (ys(i+1)-ys(i))/h1);
end

g = gausseliminationpivot(A,y,n-1);

display(A);
display(y);
display(g);

% Polynomial coefficients
h = xs(2)-xs(1);
a = (g(1)-0)/(6*h);
b = g(1)/2;
c = ((ys(2)-ys(1))/h) + ((2*h*g(1)+0*h)/6);
d = ys(2);
sp = @(x) a*(x-xs(2))^3 + b*(x-xs(2))^2 + c*(x-xs(2)) + d;