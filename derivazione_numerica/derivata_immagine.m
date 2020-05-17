% Esercitazione per la visualizzazione della derivazione numerica applicata
% alla elaborazione delle immagini digitali
%% Inizializzazione
clear all
close all
clc

% Generatore random di numeri inizializzato con il seed di default
% in questo modo ad ogni esecuzione del codice le funzioni che
% restituiscono numeri random pseudo-casuali ripartiranno dallo stesso
% punto di partenza. All'atto pratico significa generare dati
% pseudo-casuali riproducibili.
rng('default');

format long
addpath('..\lib')

%% Lettura delle immagini
% Osservare il tipo di dato di im (uint8, numero intero senza segno
% rappresentabile con 1 byte, il cui range è tra 0 e 255)
% Osservare la dimensione di im
% dimensione 1: height (altezza, ovvero il numero di righe)
% dimensione 2: width (larghezza, ovvero il numero di colonne)
% dimensione 3: channels (numero di canali di colore, Red, Green e Blue)
im = imread('thewall.jpg');
im1 = double(rgb2gray(im));
% La funzione rgb2gray converte un'immagine RGB in un'immagine in scala di
% grigi. Pertanto la terza dimensione torna ad essere pari a 1. double()
% converte il dato da uint8 a double.
% im1 quindi è una matrice contenenti dati di tipo double

%% Calcolo derivata prima
% Ricordando che la formula alle differenze centrali prevede, dato un punto
% centrale t_n i due punti limitrofi t_n-1 e t_n+1, di approssimare la
% derivata prima in t_n come (f(t_n+1) - f(t_n-1) / 2h )

% Osservare il modo in cui è scritto il calcolo delle derivate. Si suppone
% h = 1 (distanza di un pixel tra ogni campione) 
D1_righe = (im1(:,3:end) - im1(:,1:end-2)) * 0.5;
D1_colonne = (im1(3:end,:) - im1(1:end-2,:)) * 0.5;

D1_righe_colonne =  (im1(2:end-1,3:end) + im1(3:end,2:end-1) ...
                    - im1(2:end-1, 1:end-2) - im1(1:end-2, 2:end-1)) * 0.5;

%% Visualizzazione dei risultati
figure
subplot(3,2,[1 2])
imagesc(im1)
axis off
title('Immagine da elaborare')
set(gca, 'Fontsize', 18)

subplot(3,2,3)
imagesc(D1_righe)
axis off
title('Derivata prima lungo le righe')
set(gca, 'Fontsize', 18)

subplot(3,2,4)
imagesc(D1_colonne)
axis off
title('Derivata prima lungo le colonne')
set(gca, 'Fontsize', 18)

subplot(3,2,[5 6])
imagesc(D1_righe_colonne)
axis off
title('Derivata prima lungo le righe e le colonne')
set(gca, 'Fontsize', 18)
colormap gray

%% Calcolo derivata sweconda
% In maniera analoga a quanto fatto per il calcolo della derivata prima
% si procede applicando la formula f(t_n+1) -2f(t_n) + f(t_n-1) / h^2 

D2_righe = (im1(:,3:end) - 2*im1(:,2:end-1) + im1(:,1:end-2));
D2_colonne = (im1(3:end,:) - 2*im1(2:end-1,:) + im1(1:end-2,:));

D2_righe_colonne =  im1(2:end-1, 3:end) + im1(2:end-1, 1:end-2) ...
                    -4 * im1(2:end-1,2:end-1) ...
                    + im1(3:end,2:end-1) + im1(1:end-2,2:end-1);

%% Visualizzazione dei risultati
figure
subplot(3,2,[1 2])
imagesc(im1)
axis off
title('Immagine da elaborare')
set(gca, 'Fontsize', 18)

subplot(3,2,3)
imagesc(D2_righe)
axis off
title('Derivata seconda lungo le righe')
set(gca, 'Fontsize', 18)

subplot(3,2,4)
imagesc(D2_colonne)
axis off
title('Derivata seconda lungo le colonne')
set(gca, 'Fontsize', 18)

subplot(3,2,[5 6])
imagesc(D2_righe_colonne)
axis off
title('Derivata seconda lungo le righe e le colonne')
set(gca, 'Fontsize', 18)
colormap gray