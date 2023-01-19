% Solves the BVP given by 2xy''-3y'+xsin(y)=2
a0 = -4;
b0 = -1;
alpha = 1;
beta = 3;
N = 6;

h = (b0-a0)/(N); % step
A = zeros(N-1);
B = zeros(N-1,1);
r = zeros(N-1,1);

% Mounting the first row of the system
x = a0 + h;
r(1) = (2/3)*x + 11/3;
A(1,1) = -2+(h^2*sin(y(1)))/(2); %% Y(1)???
A(1,2) = (1 - (3*h)/(4*(-4+h)));
B(1) = -1*(-1-(3*h)/(4*(-4+h))) + (h^2)/(-4+h);

% The second row up to the N-2 row
for i=2:N-2
    x = a0 + i*h;
    r(i) = (2/3)*x + 11/3;
    A(i,i-1) = (1 + (3*h)/(4*(-4+i*h)));
    A(i,i) = -2+(h^2*sin(y(i)))/2;
    A(i,i+1) = (1 - (3*h)/(4*(-4+i*h)));
    B(i) = h^2/(-4+i*h);
end

% The last row (N-1) of the system
x = b0-h;
r(N-1) = (2/3)*x + 11/3;
A(N-1,N-2) = (1 + (3*h)/(4*(-4+(N-1)*h)));
A(N-1,N-1) = -2+(h^2*sin(y(N-1)))/2;
B(N-1) = h^2/(-4+(N-1)*h) - 3*(1 - (3*h)/(4*(-4+(N-1)*h)));

% display(A);
% display(B);