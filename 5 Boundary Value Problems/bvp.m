function X = bvp(fun,x0,xn,n)

% Attention: project in development
% Inputs
% the function fun which we are evaluating
% x0, the initial value
% xn, the end value
% n, the number of intervals

% Step definition
x0 = a;
xn = b;
h = (b - a)/n;

% Approximation for the first derivative
if diff = "forward"
  dy = (y(i+1)-y(i))/h;
elseif diff = "delay"
  dy = (y(i)-y(i-1))/h;
elseif diff = "center"
  dy = (y(i+1) - y(i-1))/2*h;
end

% Approximation for the second derivative
ddy = (y(i+1)-2*y(i)+y(i-1))/h^2;

% Make and solve the system of equations
for i=0:(n-1)
  for j=0:(n-1)

  end
end
% Write the matrix system and solve
% If linear
% If non-linear

% Solution
for k=0:(n-1)
  xk = x0+k*h;
  yk = y(xk);
end

end
