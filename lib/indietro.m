function x = indietro(A, b)

n = length(b);
x = zeros(n, 1);

if(abs(A(n,n)) < eps)
    error('Matrice A singolare');
end

x(n) = b(n)/A(n,n);
for k=n-1:-1:1
    x(k) = b(k) - A(k,k+1:n)*x(k+1:n);
    
    if(abs(A(k,k)) < eps)
        error('Matrice A singolare');
    else
        x(k) = x(k)/A(k,k);
    end
end
end