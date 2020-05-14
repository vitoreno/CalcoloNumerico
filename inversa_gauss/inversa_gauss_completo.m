% Esercitazione per il calcolo della matrice inversa di A con il metodo di
% Gauss
% Si osserva che per calcolare la matrice inversa è possibile procedere
% risolvendo un certo numero di sistemi lineari del tipo Ax = e_k in cui
% varia ogni volta il termine noto. Con e_k si intende la base canonica
% (k-esima colonna della matrice identità)
clear all
close all
clc

addpath('..\lib')
format long
rng('default');
ripetizioni = 10;
ordini = [3, 5, 10, 20, 50];
tol = 1e-9;
T1 = zeros(ripetizioni, length(ordini));
T2 = zeros(ripetizioni, length(ordini));

idx = 1;
for N = ordini
    A = randn(N,N);
    for Z = 1:ripetizioni
        tic
        A_inversa = nan(N,N);
        I = eye(N);
        for k=1:N
           A_inversa(:,k) = gauss(A, I(:,k));
        end
        if norm(eye(N) - A*A_inversa) > tol
            error('Superata la tolleranza minima imposta')
        end
        T1(Z, idx) = toc;
    end
    
    % Dal momento che la matrice dei coefficienti non cambia mai, sfrutto la
    % fattorizzazione LU per il calcolo dell'inversa di A
    for Z=1:ripetizioni
        tic
        A_inversa = nan(N,N);
        I = eye(N);
        % Calcolo L e U la prima volta.
        [A_inversa(:,1), L, U] = gauss(A, I(:,1));
        for k=2:N
           y = avanti(L, I(:,k)); % Risolvo prima il sistema triangolare Ly = e_k
           A_inversa(:,k) = indietro(U, y); % Poi procedo con Ux = y
        end
        if norm(eye(N) - A*A_inversa) > tol
            error('Superata la tolleranza minima imposta')
        end
        T2(Z, idx) = toc;
    end
    idx = idx + 1;
end

% Scrivo i tempi di esecuzione in millisecondi
T1 = T1 * 1000;
T2 = T2 * 1000;

% Visualizzazione dei risultati
% Metodo 1. Plot sovrapposto dei tempi di esecuzione
% for idx = 1:size(T1,2)
%     figure, hold on
%     plot(T1(:,idx))
%     plot(T2(:,idx))
%     legend({'Gauss', 'LU'})
%     title(['Confronto tempi di esecuzione - ordine A: ', num2str(ordini(idx))])
%     xlabel('Ripetizione')
%     ylabel('Tempo [ms]')
%     set(gca, 'Fontsize', 18')
% end

% Visualizzazione dei risultati
% Metodo 2. Diagramma dei tempi medi di esecuzione
figure, hold on
plot(ordini, mean(T1))
plot(ordini, mean(T2))
legend({'Gauss', 'LU'})
title('Calcolo della matrice inversa')
xlabel('Ordine della matrice A')
ylabel('Tempo medio [ms]')
set(gca, 'Fontsize', 18')