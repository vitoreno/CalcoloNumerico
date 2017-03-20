clear all
close all
clc

% Settaggio dei parametri
params.X = 0:0.01:2; % Dominio di riferimento
params.plot_data = true; % Flag per la visualizzazione dei risultati
params.delay = 0.05; % Tempo di aggiornamento dei grafici
params.r = 1; % Molteplicità della radice
params.max_iter = 100; % Numero massimo di iterazioni consentite
params.toll = 1e-8; % Tolleranza

z = [];
k = [];

% Ricerca della radice di f(x) = log(x)
params.f = @(x)(log(x));
[z1, k1] = newtonraphson(0.05, params);
fprintf('Zero della funzione in x: %f \n', z1);
fprintf('# Iterazioni: %d \n\n', k1);
z = [z; z1];
k = [k; k1];

% Ricerca della radice di f(x) = log(x)(x-1)
% f(x) = log(x)(x-1)
params.f = @(x)(log(x).*(x-1));
[z1, k1] = newtonraphson(0.05, params);
z = [z; z1];
k = [k; k1];
fprintf('Zero della funzione in x: %f \n', z1);
fprintf('# Iterazioni: %d \n\n', k1);

params.r = 2;
[z1, k1] = newtonraphson(0.05, params);
z = [z; z1];
k = [k; k1];
fprintf('Zero della funzione in x: %f \n', z1);
fprintf('# Iterazioni: %d \n\n', k1);

% Un altro esempio
params.f = @(x)((exp(-x).^(-1).*(x-1).^2)-0.5);
params.r = 1;

[z1, k1] = newtonraphson(0.2, params);
z = [z; z1];
k = [k; k1];
fprintf('Zero della funzione in x: %f \n', z1);
fprintf('# Iterazioni: %d \n\n', k1);

[z1, k1] = newtonraphson(1.8, params);
z = [z; z1];
k = [k; k1];
fprintf('Zero della funzione in x: %f \n', z1);
fprintf('# Iterazioni: %d \n\n', k1);

params.r = 2;
params.max_iter = 50000;
params.toll = 1e-3;

[z1, k1] = newtonraphson(1.8, params);
fprintf('Zero della funzione in x: %f \n', z1);
fprintf('# Iterazioni: %d \n\n', k1);