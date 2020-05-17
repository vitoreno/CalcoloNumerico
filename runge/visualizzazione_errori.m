% Esercitazione per la visualizzazione dell'errore di interpolazione
% calcolato interpolando su nodi equidistanti e sugli zeri del polinomio di
% Chebyshev all'aumentare del numero di nodi considerati.
%% Inizializzazione e definizione dei parametri
clear all
close all
clc

addpath('..\lib');

f = @(X)(1./(1 + X.^2)); % Funzione da interpolare
a = -5;
b = 5;

X = linspace(a,b, 1000);

err_nodi_equispaziati = [];
err_nodi_zeri_cheb = [];

%% Interpolazione con entrambi i metodi all'aumentare del numero dei nodi
nodi_da_considerare = [5, 10, 15, 20];
for num_nodi=nodi_da_considerare
    X_nodi = linspace(a,b, num_nodi);
    Y_nodi = f(X_nodi);
    
    Y = lagrange(X_nodi, Y_nodi, X);
    
    err_nodi_equispaziati = [err_nodi_equispaziati, norm(f(X) - Y)];
    
    X_nodi_cheb = (a+b)/2+(b-a)/2*cos((2*[0:num_nodi-1]+1)*pi./(2*num_nodi));
    Y_nodi_cheb = f(X_nodi_cheb);

    Y2 = lagrange(X_nodi_cheb, Y_nodi_cheb, X);

    err_nodi_zeri_cheb = [err_nodi_zeri_cheb, norm(f(X) - Y2)];
end


%% Visualizzazione dei risultati
f_h = figure;
plot(nodi_da_considerare, err_nodi_equispaziati)
hold on
plot(nodi_da_considerare, err_nodi_zeri_cheb)
legend({'Nodi equispaziati', 'Nodi zeri Chebyshev'})
title('Andamento dell''errore di interpolazione')
xlabel('Numero di nodi')
ylabel('|| f(X) - Y ||')
set(gca, 'Fontsize', 18)