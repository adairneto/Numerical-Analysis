function [sol4c,sol5c] = bvp_matlabsolver()

% MatLab solution for BVP
opts = bvpset('FJacobian',@jac,'RelTol',0.1,'AbsTol',0.1,'Stats','on');
xmesh = linspace(-4, -1, 10);
solinit = bvpinit(xmesh, [1; 1]);
sol4c = bvp4c(@bvpfcn, @bcfcn, solinit, opts);
sol5c = bvp5c(@bvpfcn, @bcfcn, solinit, opts);
% xplot = linspace(1/(3*pi),1,200);
% plot(sol4c.x,sol4c.y(1,:),'r*',sol5c.x,sol5c.y(1,:),'bo')
% title('Comparison of BVP Solvers')
% legend('BVP4C','BVP5C')
% xlabel('x')
% fprintf("Solution with sol5c: %f", sol5c.y(13));

function dydx = bvpfcn(x,y)
dydx = zeros(2,1);
dydx = [y(2)
       3/(2*x)*y(2)-sin(x)/(2*x)*y(1)+1/x];
end

function res = bcfcn(ya,yb)
res = [ya(1)-1
       yb(1)-3];
end

function dfdy = jac(x,y)
dfdy = [0      1
       -sin(x)/(2*x) 3/(2*x)];
end

function g = guess(x)
g = [sin(x)
     cos(x)];
end
end