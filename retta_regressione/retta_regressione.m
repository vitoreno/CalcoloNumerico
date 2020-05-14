% Calcolare l'espressione della retta di regressione y = mx + q che meglio
% approssima i punti contenuti nei vettori X e Y
%% Inizializzazione
clear all
close all
clc

addpath('..\lib');

%% Definizione dei punti perturbati e calcolo della retta
X = [0 1 -1 2 -3];
Y = [0 1 -1 2 -3];

X = X + rand(1, numel(X));
Y = Y + rand(1, numel(Y));

[m, q] = retta_minq(X, Y);

%% Visualizzazione dei risultati
figure, hold on
title('Risultati');
plot (X, Y, 'bo');

newX = (min(X)-2):0.2:(max(X)+2);
newY = m*newX + q;

plot(newX, newY, 'r');
plot(newX, newX, 'k--');

legend('Punti iniziali', 'Retta di regressione', 'Bisettrice 1-3 quadrante')
hold off