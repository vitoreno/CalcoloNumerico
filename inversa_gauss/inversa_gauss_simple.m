% Esercitazione per il calcolo della matrice inversa di A con il metodo di
% Gauss
% Si osserva che per calcolare la matrice inversa è possibile procedere
% risolvendo un certo numero di sistemi lineari del tipo Ax = e_k in cui
% varia ogni volta il termine noto. Con e_k si intende la base canonica
% (k-esima colonna della matrice identità)
%% Inizializzazione
clear all
close all
clc

addpath('..\lib')
format long
rng('default');
N = 4;
A = randn(N,N);

%% Calcolo dell'inversa con Gauss

A_inversa = nan(N,N);
I = eye(N);
for k=1:N
   A_inversa(:,k) = gauss(A, I(:,k));
end

%Osservare quanto valgono gli elementi delle matrici I1 e I2
I1 = A * A_inversa;
I2 = A_inversa * A;
AD = abs(I1 - I2);

%% Calcolo dell'inversa con fattorizzazione LU
% Dal momento che la matrice dei coefficienti non cambia mai, sfrutto la
% fattorizzazione LU per il calcolo dell'inversa di A
A_inversa_LU = nan(N,N);
I = eye(N);
% Calcolo L e U la prima volta.
[A_inversa_LU(:,1), L, U] = gauss(A, I(:,1));
for k=2:N
   y = avanti(L, I(:,k)); % Risolvo prima il sistema triangolare Ly = e_k
   A_inversa_LU(:,k) = indietro(U, y); % Poi procedo con Ux = y
end

%Osservare quanto valgono gli elementi delle matrici I1_LU e I2_LU
I1_LU = A * A_inversa_LU;
I2_LU = A_inversa_LU * A;
AD_LU = abs(I1_LU - I2_LU);
