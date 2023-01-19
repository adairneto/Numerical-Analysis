% Solves the BVP given by 2xy''-3y'+ysin(x)=2
a0 = -4;
b0 = -1;
alpha = 1;
beta = 3;

% Solution with N=6
N = 6; % h = 0.5
[xi,yi] = linear_bvp(a0,b0,alpha,beta,N);
% tab = table(xi,yi); % does not work in Octave
fprintf("For h=0.5: y(-2) = %f\n", yi(4));

% Solution with N=12
N = 12; % h = 0.25
[xi,yi] = linear_bvp(a0,b0,alpha,beta,N);
% tab = table(xi,yi); % does not work in Octave
fprintf("For h=0.25: y(-2) = %f\n", yi(8));

% Solution with N=300
N = 300; % h = 0.01
[xi,yi] = linear_bvp(a0,b0,alpha,beta,N);
%title("Solution points for h=0.01");
fprintf("For h=0.01: y(-2) = %f\n", yi(200));

% MatLab Solution with bvp5c
fprintf("------------------\n");
[sol4c,sol5c] = bvp_matlabsolver();
error = abs(sol5c.y(13)-yi(200));
fprintf("------------------\n");
fprintf("Error (for h=0.01): %e\n", error);

% Plotting solutions: bvp4c, bvp5c and found solution with h=0.01
xmesh = linspace(-4, -1, 10);
xplot = linspace(1/(3*pi),1,200);
plot(sol4c.x,sol4c.y(1,:),'r*',sol5c.x,sol5c.y(1,:),'bo')
hold on
plot(xi,yi,'.')
title('Comparison of solutions')
legend('BVP4C','BVP5C',"Our solution")
xlabel('x')

function [xi,yi] = linear_bvp(a0,b0,alpha,beta,N)
h = (b0-a0)/(N); % step
A = zeros(N-1);
B = zeros(N-1,1);

% Mounting the first row of the system
x = a0 + h;
A(1,1) = -2+(h^2*sin(-4+h)/(2*(-4+h)));
A(1,2) = (1 - (3*h)/(4*(-4+h)));
B(1) = 1*(-1-(3*h)/(4*(-4+h))) + (h^2)/(-4+h);

% The second row up to the N-2 row
for i=2:N-2
    x = a0 + i*h;
    A(i,i-1) = (1 + (3*h)/(4*(-4+i*h)));
    A(i,i) = -2+(h^2*sin(-4+i*h)/(2*(-4+i*h)));
    A(i,i+1) = (1 - (3*h)/(4*(-4+i*h)));
    B(i) = h^2/(-4+i*h);
end

% The last row (N-1) of the system
x = b0-h;
A(N-1,N-2) = (1 + (3*h)/(4*(-4+(N-1)*h)));
A(N-1,N-1) = -2+(h^2*sin(-4+(N-1)*h)/(2*(-4+(N-1)*h)));
B(N-1) = h^2/(-4+(N-1)*h) - 3*(1 - (3*h)/(4*(-4+(N-1)*h)));

%display(A);
%display(B);
yi = thomas(A,B,N-1);
xi = zeros(N-1,1);
for i=1:N-1
    xi(i) = a0+i*h;
end
end

function Y = thomas(A,B,N)
% Solves a tridiagonal system using Thomas' method

V = zeros(N,1);
Y = zeros(N,1);
Y(1) = B(1)/A(1,1);
U = A(1,1);

for i=2:N
    V(i-1) = A(i-1,i)/U;
    U = (A(i,i) - A(i,i-1)*V(i-1));
    Y(i) = (B(i) - A(i,i-1)*Y(i-1))/U;
end

for j=N-1:-1:1
    Y(j) = Y(j) - V(j)*Y(j+1);
end
end