% Solves the BVP given by 2xy''-3y'+ysin(x)=2
a0 = -4;
b0 = -1;
alpha = 1;
beta = 3;
N = 300;
[xi,yi] = linear_bvp(a0,b0,alpha,beta,N);
table(xi,yi); % does not work in Octave

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

display(A);
display(B);
yi = thomas(A,B,N-1);
xi = zeros(N-1,1);
for i=1:N-1
    xi(i) = a0+i*h;
end
end