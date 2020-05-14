function [m, q] = retta_minq(X, Y)
%% retta_minq
% Funzione per Calcolo della retta ai minimi quadrati
% Parametri:
%   X - vettore di coordinate x dei punti
%   Y - vettore di coordinate y dei punti
%
% Output:
%   m - coefficiente angolare della retta
%   q - intercetta

Sxx = sum(X.^2);
Sx = sum(X);
Sxy = X*Y';
Sy = sum(Y);
n = length(X) - 1;

m = ( (n+1) * Sxy - Sx*Sy) / ((n+1)*Sxx - Sx^2);
q = (Sy * Sxx - Sx*Sxy) / ((n+1) * Sxx - Sx^2);
end