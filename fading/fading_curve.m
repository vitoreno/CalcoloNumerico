%% Sezione 1
% Calcolo di un effetto fading per il passaggio da un'immagine di partenza
% a un'immagine di arrivo con l'interpolazione di Lagrange. Rispetto alla
% esercitazione precedente è presente una immagine intermedia.
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

%% Sezione 2 - Lettura delle immagini.
% Osservare il tipo di dato di im (uint8, numero intero senza segno
% rappresentabile con 1 byte, il cui range è tra 0 e 255)
% Osservare la dimensione di im
% dimensione 1: height (altezza, ovvero il numero di righe)
% dimensione 2: width (larghezza, ovvero il numero di colonne)
% dimensione 3: channels (numero di canali di colore, Red, Green e Blue)
im = imread('darkside.jpg');
im1 = rgb2gray(im);
im = imread('thewall.jpg');
im2 = rgb2gray(im);
% La funzione rgb2gray converte un'immagine RGB in un'immagine in scala di
% grigi. Pertanto la terza dimensione torna ad essere pari a 1.
% im1 e im2 quindi sono matrici contenenti dati di tipo uint8

% Per lo scopo dell'esercitazione è necessario però disporre di matrici
% quadrate contenenti numeri rappresentati in double.
% Le prossime istruzioni preparano i dati tramite opportune conversioni
[height_1, width_1] = size(im1); 
[height_2, width_2] = size(im2);

% Si definisce una dimensione target NxN, dove N è la dimensione minima
N = min(min(height_1, height_2), min(width_1, width_2));
target_size = [N N];
% Il comando centerCropWindow2d definisce una finestra che può essere
% utilizzata come parametro di imcrop.
% imcrop serve a ritagliare una porzione di immagine
% osservare che window è centrata rispetto all'immagine
% infine, double(...) effettua una conversione del dato uint8
% trasformandolo in double
window = centerCropWindow2d(size(im1), target_size);
im_start = double(imcrop(im1, window));
window = centerCropWindow2d(size(im2), target_size);
im_end = double(imcrop(im2, window));

% Osservare quindi le dimensioni e il tipo di im_start e im_end

im = imread('atomheart.jpg');
im3 = rgb2gray(im);
window = centerCropWindow2d(size(im3), target_size);
im_intermediate = double(imcrop(im3, window));

%% Sezione 3 - Display dei risultati in un'unica figura
% Osservare l'utilizzo del comando subplot
figure
subplot(131)
imagesc(im_start)
axis off
title('Immagine di partenza')
set(gca, 'Fontsize', 18)

subplot(132)
imagesc(im_intermediate)
axis off
title('Immagine intermedia')
set(gca, 'Fontsize', 18)

subplot(133)
imagesc(im_end)
axis off
title('Immagine di arrivo')
set(gca, 'Fontsize', 18)

colormap gray
%% Sezione 4 - Interpolazione

% Per utilizzare l'interpolazione di Lagrange con la funzione appena creata
% è necessario definire quali siano i nodi e il vettore su cui interpolare.
% Si definisce un polinomio di Lagrange per ogni coppia di pixel omologhi
% presi dalle due immagini.
% Detti i e j indici di riga e di colonna, i valori di grigio dei pixel
% saranno le Y dei nodi. Le X dei nodi sono invece pari a 0 per l'immagine
% di partenza e 1 per l'immagine di arrivo e 0.5 per l'imamgine intermedia.
% L'interpolazione sarà effettuata su 100 punti equispaziati tra 0 e 1.

N_frames = 100;
X = [0 0.5 1];
new_X = linspace(0, 1, N_frames);

vid = zeros(N, N, N_frames);
for i = 1:N
    for j = 1:N
        Y = [im_start(i,j), im_intermediate(i,j), im_end(i,j)];
        vid(i,j,:) = lagrange(X, Y, new_X);
    end
end

%% Sezione 5 - Visualizzazione dei risultati

figure
for idx = 1:N_frames
    imagesc(vid(:,:,idx))
    axis off
    colormap gray
    title(['Frame ', num2str(idx), '/', num2str(N_frames)])
    pause(0.05)
    
    if idx == 50
        pause
    end
end