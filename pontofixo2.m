function raiz = pontofixo2(phi, x_0, epsilon)

k = 0;
error = epsilon + 1;

if abs(phi(x_0)) < epsilon
    raiz = x_0;
else
    while (abs(phi(x_0)) >= epsilon) && (abs(error) >= epsilon)
        k = k+1;
        x = phi(x_0);
        error = abs(x - x_0);
        x_0 = x;
    end
end
raiz = x;
end