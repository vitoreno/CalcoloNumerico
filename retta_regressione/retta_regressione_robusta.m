% Esercitazione per il calcolo di una retta di regressione robusta
%% Inizializzazione
clear all
close all
clc

rng('default')
addpath('..\lib');

%% Definizione dei punti e calcolo della retta
X = -10:10;
Y = -10:10;

X = X + rand(1, numel(X));
Y = Y + rand(1, numel(Y));

X = [X, 3.5, -7.5];
Y = [Y, 50, 100];

[m, q] = retta_minq(X, Y);

%% Visualizzazione dei risultati
f_h = figure;
hold on
title('Risultati');
plot (X, Y, 'bo');

newX = (min(X)-2):0.2:(max(X)+2);
newY = m*newX + q;

plot(newX, newY, 'r');

legend('Punti iniziali', 'Retta di regressione')

%% Alla ricerca del modello migliore
N_pts_exclude = round(numel(X)*0.2);
N = numel(X) - N_pts_exclude;
N_models = 20;
M = [];
Q = [];
epsilon = [];
for k=1:N_models
    P = randperm(numel(X));
    X_perm = X(P(1:N));
    Y_perm = Y(P(1:N));
    [M(k), Q(k)] = retta_minq(X_perm, Y_perm);
    
    epsilon(k) = norm(Y_perm - (M(k).*X_perm + Q(k)));
end

[minval, model_idx] = min(epsilon);

%%
figure(f_h)
clf
% Visualizzo i punti iniziali con un colore che cambia in base alla
% distanza dal modello scelto. In questo modo evidenzio gli outlier.
dist = abs(Y - (M(model_idx)*X + Q(model_idx)));
scatter(X,Y,50,dist,'filled')
colormap copper
hold on

plot(newX, m*newX+q, 'r');
newY = M(model_idx)*newX + Q(model_idx);


plot(newX, newY, 'g');
legend({'Punti iniziali', 'Retta di regressione', 'Retta robusta'})

%% Le altre rette scartate...
% figure(f_h)
% for k=1:N_models
%     if k ~= model_idx
%         plot(newX, M(k)*newX + Q(k), 'k:');
%     end
% end