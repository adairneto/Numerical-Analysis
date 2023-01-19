function x = gausseliminationpivot(A, b, n)
    for k=1:n-1
        
        % Finds the pivot
        max = abs(A(k,k));
        maxv = k;
        for i=k+1:n
            if abs(A(i,k)) > max
                max = abs(A(i,k));
                maxv = i;
            end
        end
        % fprintf("Pivot: %f\n", max); 
        
        % Exchanges
        mem = A(k,:);
        A(k,:) = A(maxv,:);
        A(maxv,:) = mem;
        mem = b(k,:);
        b(k,:) = b(maxv,:);
        b(maxv,:) = mem;
        % fprintf("New matrix: \n");
        % disp(A);
        % fprintf("\nNew b: \n");
        % disp(b);
        
        % Gauss elimination procedure
        for i = k+1:n
            m = A(i,k) / A(k,k);
            A(i,k) = m;
            b(i, :) = b(i, :) - m * b(k, :);
            for j=k+1:n
                A(i,j) = A(i,j) - m * A(k,j);
            end  
        end
    end
    x = backsubstitution(A, b, n);
end