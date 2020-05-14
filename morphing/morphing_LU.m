%% Sezione 1
% Calcolo della matrice di trasformazione di un'immagine di partenza in
% un'immagine di arrivo.
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

%% Sezione 3 - Display dei risultati in un'unica figura
% Osservare l'utilizzo del comando subplot
figure
subplot(121)
imagesc(im_start)
axis off
title('Immagine di partenza')
set(gca, 'Fontsize', 18)

subplot(122)
imagesc(im_end)
axis off
title('Immagine di arrivo')
set(gca, 'Fontsize', 18)

% Cosa si nota nella colorazione dell'immagine?
% Cliccare sul pulsante della legenda e osservare la mappa dei colori
% Cambiare mappa dei colori tramite il comando colormap
% Provare varie combinazioni (winter, jet, hot, ...)  e utilizzare infine
colormap gray

%% Sezione 4 - Calcolo della matrice di trasformazione (parte 1)
% In maniera analoga a quanto fatto per il calcolo della matrice inversa
% nella precedente esercitazione si procede a calcolare la matrice di
% trasformazione T tale che (im_start * T) fornisca im_end
T = nan(N, N);
% Calcolo L e U la prima volta.
[T(:,1), L, U] = gauss(im_start, im_end(:,1));
for k=2:N
   y = avanti(L, im_end(:,k));
   T(:,k) = indietro(U, y);
end

% Osservare il comportamento della funzione ed eventuali codici di errore
% prodotti.

%% Sezione 4bis - Alcune riflessioni...
% Ipotizzare eventuali modi per risolvere il problema. (ad es. Pivoting?)
% Caratterizzare quindi il problema calcolando il determinante della
% matrice dei coefficienti e l'indice di condizionamento
determinante = det(im_start)
condizionamento = cond(im_start)

% Per quale motivo il determinante è 0 ?
% Come è possibile accorgersi del fatto che ci sono almeno due righe
% linearmente dipendenti in im_start semplicemente osservando le immagini
% in figura?

%% Sezione 5 - Introduzione del rumore gaussiano
% Si vogliono quindi valutare gli effetti di una possibile perturbazione di
% im_start che, in pratica, non alteri l'aspetto dell'immagine, ma che
% introduca una certa variabilità tra i coefficienti in modo tale da
% rendere im_start non singolare.

noise = randn(N, N);

figure, imagesc(noise), title('Pattern di rumore gaussiano')
figure, histogram(noise), title('Istogramma del rumore')

im_start_old = im_start;
im_start = im_start + noise;

figure
subplot(121)
imagesc(im_start_old)
axis off
title('Immagine di partenza')
set(gca, 'Fontsize', 18)

subplot(122)
imagesc(im_start)
axis off
title('Immagine di partenza con noise')
set(gca, 'Fontsize', 18)

colormap gray
% Si apprezzano differenze sensibili all'occhio umano?
% Verificare cosa succede al variare della colormap (es. pink, jet)

%% Sezione 6 - Alcune valutazioni quantitative
% Controllo nuovamente il determinante e l'indice di condizionamento
determinante = det(im_start)
condizionamento = cond(im_start)

% Osservare quanto si è ridotto l'indice di condizionamento rispetto al
% caso precedente.
% Osservare il valore del determinante e ipotizzare perché sia stato
% restituito proprio tale valore.

%% Sezione 7 - Calcolo della matrice di trasformazione (parte 2)

[T(:,1), L, U] = gauss(im_start, im_end(:,1));
for k=2:N
   y = avanti(L, im_end(:,k));
   T(:,k) = indietro(U, y);
end

norm((im_start * T) - im_end)

figure
subplot(121)
imagesc(im_end)
axis off
title('Immagine di arrivo')
set(gca, 'Fontsize', 18)

subplot(122)
imagesc(im_start * T)
axis off
title('Immagine di arrivo ricostruita')
set(gca, 'Fontsize', 18)

colormap gray

%% Sezione 8 - Osservazioni e approfondimenti
% Per rispondere alla domanda sul valore del determinante, osservare cosa
% sia per MATLAB il simbolo Inf (doc Inf). A questo punto osservare quanto
% vale il massimo numero rappresentabile nell'insieme dei numeri di
% macchina tramite il comando realmax('double')
% Valutare se è ragionevole supporre che tale valore sia stato superato, a
% sinistra o a destra, dal valore del determinante di im_start.
% Per fare questo si può osservare il vettore contenente la diagonale della
% matrice U, ovvero il vettore contenente i fattori della produttoria per
% il calcolo del determinante.
diagonale_U = diag(U);

figure
plot(diagonale_U, 'x-', 'MarkerSize', 5, 'LineWidth', 1.5)

% Zoomare intorno allo zero e osservare l'oscillazione dei dati.
% Quanto varrebbe il determinante se ogni fattore fosse pari a 10?
% Tale numero sarebbe superiore o inferiore al massimo numero
% rappresentabile nell'insieme dei numeri di macchina?
