function x = avanti(A, b)

n = length(b);
x = zeros(n, 1);

if(abs(A(1,1)) < eps)
    error('Matrice A singolare');
end

x(1) = b(1)/A(1,1);
for k=2:n
    x(k) = b(k) - A(k,1:k-1)*x(1:k-1);
    
    if(abs(A(k,k)) < eps)
        error('Matrice A singolare');
    else
        x(k) = x(k)/A(k,k);
    end
end
end