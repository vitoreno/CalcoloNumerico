% Esercitazione per la visualizzazione grafica del fenomeno di
% Runge. Eseguire lo script all'aumentare del numero dei nodi e osservare
% il comportamento.
%% Inizializzazione e definizione dei parametri
clear all
close all
clc

addpath('..\lib');

f = @(X)(1./(1 + X.^2)); % Funzione da interpolare
a = -5;
b = 5;

X = linspace(a,b, 1000);

%% Interpolazione con nodi equidistanti
num_nodi = 23;
X_nodi = linspace(a,b, num_nodi);
Y_nodi = f(X_nodi);

Y = lagrange(X_nodi, Y_nodi, X);

%% Visualizzazione dei risultati
f_h = figure;
plot(X_nodi, Y_nodi, 'ro')
hold on
plot(X, Y, 'b')
plot(X, f(X), 'g:', 'LineWidth', 2)
legend({'Nodi', 'Ln(x)', 'f(x)'})

%% Interpolazione sugli zeri del polinomio di Chebyshev di grado n

X_nodi_cheb = (a+b)/2+(b-a)/2*cos((2*[0:num_nodi-1]+1)*pi./(2*num_nodi));
Y_nodi_cheb = f(X_nodi_cheb);

Y2 = lagrange(X_nodi_cheb, Y_nodi_cheb, X);

%% Visualizzazione dei risultati
f_h2 = figure;
plot(X_nodi_cheb, Y_nodi_cheb, 'ro')
hold on
plot(X, Y2, 'b')
plot(X, f(X), 'g:', 'LineWidth', 2)
legend({'Nodi', 'Ln(x)', 'f(x)'})