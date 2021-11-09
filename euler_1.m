function y = euler_1(fun, pts, x0, xn, i, yi)
% Entries:
% Fun: the function to be evaluated
% Pts: the # of points
% x0: starting point
% xn: ending point
% i and yi: initial value

	% Initialization
	x = linspace(x0,xn,pts);
	h = x(xn) - x(x0);
	y = zeroes(pts,1);
	y(i) = yi;

	for k=i:pts-1
		y(k+1) = y(n)+h*f(x(n),y(n));
	end

	plot(x,y,'x-');
end
