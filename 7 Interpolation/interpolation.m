function out = interpolation(xs,ys)
% xs = [-1, 0, 2];
% ys = [4, 1, -1];

n = length(xs);
b = ys.';
for i=1:n
    for j=1:n
        A(i,j) = xs(i)^(j-1);
    end
end

out = gausseliminationpivot(A, b, n);

end