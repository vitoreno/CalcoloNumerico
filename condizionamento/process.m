% Risolviamo il sistema A1 x = b
A1 = [1 1; 1000 1001];
b = [2; 2001];
x1 = A1\b;

% Perturbiamo il primo coefficiente di A1
A2 = A1;
A2(1,1) = A2(1,1) + 0.01;
x2 = A2\b;

% Valutiamo quanto si discostano tra loro le due soluzioni
norm(x1 - x2);

% Calcoliamo l'indice di condizionamento di N sistemi che abbiano come
% matrice dei coefficienti la matrice di Hilbert
N = 20;
K = [];
for order = 1:N
    A = hilb(order);
    K(order) = norm(A)*norm(inv(A));
end
plot(K, 'x--');


