% Esempio di iterazione funzionale
% con il costrutto "function handle" e il grafico in realtime
clear all
clc

format long

%g = @(x)(exp(-x)); % Esempio convergente
g = @(x)(x.^2 + 0.4); % Esempio divergente
%g = @(x)(x.^2 + 0.2); % Esempio convergente

X_ = [-1:1e-3:2];
Y_ = g(X_);

f_h = figure;
xlim([-0.2 1]);
ylim([-0.2 1]);
hold on;
plot([-2 2], [-2 2], 'k--');
plot([0 0], [-2 2], 'k');
plot([-2 2], [0 0], 'k');
plot(X_, Y_, 'r-.');


epsilon = 1e-3; % Tolleranza
max_iter = 1000;

x_old = 0.01; % Punto iniziale
x_new = g(x_old);
idx = 0;

while(abs(x_old - x_new) > epsilon && idx < max_iter)
    
    plot(x_old, 0, 'b.', 'MarkerSize', 20); drawnow; pause(0.3);
    plot([x_old x_old], [x_old x_new], 'b'); drawnow; pause(0.3);
    plot([x_old x_new], [x_new x_new], 'b'); drawnow; pause(0.3);
    
    x_old = x_new;
    x_new = g(x_old);
    
    fprintf('Iterazione %d: x %.10f - g(x) %.10f\n',idx, x_old, x_new);
    
    idx = idx + 1;
end
