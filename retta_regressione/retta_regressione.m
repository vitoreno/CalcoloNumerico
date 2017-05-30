% Calcolare l'espressione della retta di regressione y = mx + q che meglio
% approssima i punti contenuti nei vettori X e Y

clear all
close all

X = [0 1 -1 2 -3];
Y = [0 1 -1 2 -3];

X = X + rand(1, numel(X));
Y = Y + rand(1, numel(Y));

figure, hold on
title('Risultati');
plot (X, Y, 'bo');

Sxx = sum(X.^2);
Sx = sum(X);
Sxy = X*Y';
Sy = sum(Y);
n = length(X) - 1;

m = ( (n+1) * Sxy - Sx*Sy) / ((n+1)*Sxx - Sx^2);
q = (Sy * Sxx - Sx*Sxy) / ((n+1) * Sxx - Sx^2);

newX = (min(X)-2):0.2:(max(X)+2);
newY = m*newX + q;

plot(newX, newY, 'r');
plot(newX, newX, 'k--');

legend('Punti iniziali', 'Retta di regressione', 'Bisettrice 1-3 quadrante')
hold off