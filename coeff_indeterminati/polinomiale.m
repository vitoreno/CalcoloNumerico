% Esercitazione interattiva per la stima di un polinomio con il metodo dei
% coefficienti indeterminati
% Osservare l'utilizzo delle nuove funzioni nelle varie sezioni
%% Inizializzazione
clear all
close all
clc

addpath('..\lib');

%% Input dei nodi
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

%% Calcolo dei coefficienti del polinomio
N_pts = length(X_user);
grado = N_pts - 1;

V = nan(N_pts, N_pts);

for i=0:grado
    V(:, i+1) = X_user .^ i;
end

alpha = gauss(V, Y_user);

%% Interpolazione
X_start = min(X_user);
X_end = max(X_user);
N_interp = 1000;

X_interp = linspace(X_start, X_end, N_interp);

Y_interp = zeros(1, N_interp);
for g = 0:grado
    Y_interp = Y_interp + (alpha(g+1) * (X_interp .^ g));
end

%% Estrapolazione
delta = abs(X_end - X_start) * 0.3;
X_end = min(X_user);
X_start = X_end - delta;

X_estrap_sx = linspace(X_start, X_end, N_interp);

Y_estrap_sx = zeros(1, N_interp);
for g = 0:grado
    Y_estrap_sx = Y_estrap_sx + (alpha(g+1) * (X_estrap_sx .^ g));
end

X_start = max(X_user);
X_end = X_start + delta;

X_estrap_dx = linspace(X_start, X_end, N_interp);

Y_estrap_dx = zeros(1, N_interp);
for g = 0:grado
    Y_estrap_dx = Y_estrap_dx + (alpha(g+1) * (X_estrap_dx .^ g));
end

%% Visualizzazione dei risultati

f_h = figure;
plot([-100; 100], [0; 0], 'k', 'LineWidth', 2)
hold on
plot([0; 0], [-100; 100], 'k', 'LineWidth', 2)

plot(X_user, Y_user, 'rx');
plot(X_interp, Y_interp, 'b')
plot(X_estrap_sx, Y_estrap_sx, 'g--')
plot(X_estrap_dx, Y_estrap_dx, 'r--')

title('Risultato')
legend({'Asse X', 'Asse Y', 'Nodi', 'Interpolazione', 'Estrapolazione sx', 'Estrapolazione dx'})
