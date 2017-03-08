% Esempio di iterazione funzionale
clear all
clc

format long

epsilon = 1e-8; % Tolleranza
max_iter = 1000;

x_old = 0.01; % Punto iniziale
x_new = f(x_old);
idx = 0;
while(abs(x_old - x_new) > epsilon && idx < max_iter)
    x_old = x_new;
    x_new = f(x_old);
    
    fprintf('Iterazione %d: x %.10f - f(x) %.10f\n',idx, x_old, x_new);
    idx = idx + 1;
end

% Definizione delle funzioni
function y = f(x)
    y = exp(-x);
end

function y = g(x)
    y = -log(1/(1+x^2));
end