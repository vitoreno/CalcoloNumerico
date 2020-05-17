% Utilizzo della retta di regressione per stimare f(x) = B e^Ax
%% Inizializzazione
clear all
close all
clc

addpath('..\lib');

%% Scelta dei nodi
answer = 'No';
f_h = figure;
while string(answer) == "No"
    plot([-100; 100], [0; 0], 'k', 'LineWidth', 2)
    hold on
    plot([0; 0], [-100; 100], 'k', 'LineWidth', 2)
    title('Seleziona un certo numero di punti e premi invio')
    xlabel('X')
    ylabel('Y')
    [X_user, Y_user] = getpts(f_h);
    plot(X_user, Y_user, 'rx');
    answer = questdlg('Points ok?');
    hold off
end
close(f_h)

%% Stima della retta di regressione sui punti (x_i, log(y_i))
[m, q] = retta_minq(X_user', log(Y_user'));

A_stimato = m;
B_stimato = exp(q);

%% Visualizzazione dei risultati
figure, hold on
title('Risultati');
plot([-100; 100], [0; 0], 'k', 'LineWidth', 2)
plot([0; 0], [-100; 100], 'k', 'LineWidth', 2)
plot (X_user, Y_user, 'bx');

newX = (min(X_user)-2):0.2:(max(X_user)+2);
newY = exp(m*newX + q);
plot(newX, newY, 'r');

newY2 = B_stimato * exp(A_stimato * newX);
plot(newX, newY2, 'k--');
hold off