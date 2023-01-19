% xs = [1, 1.01, 1.02, 1.03, 1.04, 1.05];
% ys = [1, 1.005, 1.01, 1.0149, 1.0198, 1.0247];

xs = [0.2, 0.33, 0.4, 0.52, 0.6, 0.7];
ys = [0.16, 0.22, 0.27, 0.29, 0.32, 0.37];
n = length(xs);
diftab = divdiff(xs,ys,n); % Generates the table of divided differences
display(diftab);

M = max(max(abs(diftab(:,4)))); % Useful for the error
display(M);

xs = [0.4, 0.52, 0.6];
ys = [0.27, 0.29, 0.32];
n = length(xs);
diftab = divdiff(xs,ys,n); % Generates the table of divided differences

f1 = @(x) ys(1) + (x-xs(1))*diftab(2,2); % degree one polynomial
f2 = @(x) f1(x) + (x-xs(1))*(x-xs(2))*diftab(3,3); % degree two polynomial
% ddf = @(x) exp(x); % second derivative 
% dddf = @(x) exp(x); % third derivative 

% Error
% xs = [0.34, 0.4, 0.52, 0.6];
% ys = [0.22, 0.27, 0.29, 0.32];
% n = length(xs);
% diftab = divdiff(xs,ys,n);
% display(diftab);
% M = max(max(abs(diftab)));
% display(M);
% M1 = erroraux(ddf,xs);
% M1 = 2*M;
% e1 = @(x) abs((x-xs(1))*(x-xs(n)))*M1/2;
% M2 = erroraux(dddf,xs);
% M2 = 6*M;
% e2 = @(x) abs((x-xs(1))*(x-xs(2))*(x-xs(n)))*M2/6;
error = @(x) abs((x-xs(1))*(x-xs(2))*(x-xs(3)))*M;

% Print results
p1 = f1(0.47);
erro1 = error(0.47);
p2 = f2(0.47);
erro2 = error(0.47);
table(p1,erro1,p2,erro2)

function max = erroraux(fun,xs)
max = 0;
len = length(xs);
for i=1:len
    temp = abs(fun(xs(i)));
    if temp > max
        max = temp;
    end
end
end

function diftab = divdiff(xs,ys,n)
diftab = zeros(n);
for i=1:n
    for j=1:n
        if j <= i
            diftab(i,j) = divaux(xs,ys,i-j+1,i);
        end
    end
end
end

function dif = divaux(xs,ys,s,f)
if s==f || s>f
    dif = ys(s);
else
    dif = (divaux(xs,ys,s+1,f)-divaux(xs,ys,s,f-1))/(xs(f)-xs(s));
end
end