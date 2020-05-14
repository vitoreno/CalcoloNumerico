function [x, varargout] = gauss(A,b)
[m, n] = size(A);
if m~=n
    error('Metodo non applicabile');
end
if length(b) ~= n
    error('Metodo non applicabile');
end

for k=1:n
    if abs(A(k,k)) < eps
        error('Elemento pivotale nullo')
    end
    for i=k+1:n
        A(i,k) = A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j) = A(i,j)-A(i,k)*A(k,j);
        end
        b(i) = b(i) - b(k)*A(i,k);
    end
end

x = indietro(A,b);

% Se il numero di output richiesti è almeno 2, restituisci anche la matrice
% L
if nargout >= 2
   % Osservo che i moltiplicatori di Gauss sono stati salvati nella parte
   % triangolare inferiore della matrice A trasformata. Sfrutto i conti per
   % restituire la matrice L che si ottiene fattorizzando A=LU senza
   % pivoting
   L = tril(A);
   for i=1:n
       L(i,i) = 1;
   end
   varargout{1} = L;
end

% Se il numero di output richiesti è almeno 3, restituisci anche la matrice
% U
if nargout >= 3
    U = triu(A);
    varargout{2} = U;
end

end