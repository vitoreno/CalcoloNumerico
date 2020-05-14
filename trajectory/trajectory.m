%% Sezione 1
% Interpolazione e sovraimpressione di una traiettoria su un video
clear all
close all
clc

format long
addpath('..\lib')

%% Sezione 2 - Visualizzazione del video
v = VideoReader('cucchiaio.mp4');

f_h = figure;
for idx = 1:v.NumFrames
    frame = read(v, idx);
    imagesc(frame)
    axis off
    title(['Frame ', num2str(idx), '/', num2str(v.NumFrames)])
    pause(0.05)
end

%% Sezione 3 - Estrazione dei frame iniziale, medio e finale
frame_iniziale = read(v, 1);
frame_intermedio = read(v, v.NumFrames/2);
frame_finale = read(v, v.NumFrames);

f_h = figure;
imagesc(frame_iniziale)
title('Seleziona un punto e premi invio')
[x1, y1] = getpts;
close(f_h)

f_h = figure;
imagesc(frame_intermedio)
title('Seleziona un punto e premi invio')
[x2, y2] = getpts;
close(f_h)

f_h = figure;
imagesc(frame_finale)
title('Seleziona un punto e premi invio')
[x3, y3] = getpts;
close(f_h)

%% Sezione 4 - Interpolazione
new_X = linspace(x1, x3, 1000);
new_Y = lagrange([x1 x2 x3], [y1 y2 y3], new_X);

%% Sezione 5 - Visualizzazione dei risultati
f_h = figure;
for idx = 1:v.NumFrames
    frame = read(v, idx);
    imagesc(frame)
    hold on
    plot(new_X, new_Y, 'r--', 'MarkerSize', 2);
    title(['Frame ', num2str(idx), '/', num2str(v.NumFrames)])
    pause(0.1)
end


