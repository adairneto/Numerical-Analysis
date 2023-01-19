function x = nonlinear_newton(F,J,x_k,epsilon)

% Entrada:
% F = @(X)[X(1)^2 + X(2)^2 + X(3)^2 - 4; (9/2)*(X(1)^2 + X(3)^2)+X(2)^2-9; X(3)-sqrt(10/7)*sin((pi/2)*(X(2)-sqrt(18/7)+1))];
% J = @(X)[2*X(1), 2*X(2), 2*X(3); 9*X(1), 2*X(2), 9*X(3); 0, -(7^(1/2)*10^(1/2)*pi*cos((pi*(X(2) - (3*2^(1/2)*7^(1/2))/7 + 1))/2))/14, 1];
% x_k = [1;0.1;1];
% epsilon = 10^(-3);
% x = nonlinear_newton(F,J,x_k,epsilon);
% display(x);

k = 0;
while 1
    Fk = feval(F,x_k);
    Jk = feval(J,x_k);

    if norm(Fk, Inf) < epsilon
        x = x_k;
        return
    else
        % s_k = -Jk\Fk;
        [row, ~] = size(Jk);
        s_k = gausseliminationpivot(-Jk, Fk, row);
        s_k = s_k.';
        x_k = x_k + s_k;
        if norm((x_k - (x_k - s_k)),Inf) < epsilon
            x = x_k;
            return
        else
            k = k+1;
        end
    end
end
end