% Esercitazione interattiva per la stima di un polinomio ai minimi quadrati
%% Inizializzazione
clear all
close all
clc

addpath('..\lib');

%% Input dei nodi e del grado del polinomio
answer = 'No';
f_h = figure;
while string(answer) == "No"
    plot([-100; 100], [0; 0], 'k', 'LineWidth', 2)
    hold on
    plot([0; 0], [-100; 100], 'k', 'LineWidth', 2)

    title('Seleziona un certo numero di punti e premi invio')
    xlabel('X')
    ylabel('Y')
    [X_user, Y_user] = getpts(f_h);
    plot(X_user, Y_user, 'rx');
    answer = questdlg('Points ok?');
    hold off
end
close(f_h)

bLoop = true;
while bLoop
    answer = inputdlg('Grado del polinomio?');
    if length(answer) == 1
        g = str2num(answer{1});
        if g
            bLoop = false;
        end
    end
end
%% Calcolo dei coefficienti del polinomio
% Risolvo il sistema rettangolare A alpha = Y_user

% Osservare dove è definita la funzione assembla_mat_rettangolare
% E' possibile richiamare correttamente l'istruzione solo eseguendo RUN o
% RUN SECTION, ma non facendo EVALUATE SELECTION all'interno della command
% window. Perché?
A = assembla_mat_rettangolare(X_user, g);
alpha = inv(A'*A) * A' * Y_user;

%% Approssimazione

range = max(X_user)-min(X_user);
delta = round(range * 0.5);
passo = 0.5;

X = min(X_user)-delta:passo:max(X_user)+delta;
Y = X * 0;
for i=0:g
    Y = Y + alpha(i+1)*(X.^i);
end

%% Visualizzazione dei risultati

f_h = figure;
plot([-100; 100], [0; 0], 'k', 'LineWidth', 2)
hold on
plot([0; 0], [-100; 100], 'k', 'LineWidth', 2)

plot(X_user, Y_user, 'rx');
plot(X, Y, 'b')

title('Risultato')
legend({'Asse X', 'Asse Y', 'Nodi', 'Approssimazione'})

%% Alcune verifiche
% Verificare che questo tipo di approssimazione con N punti e grado 1
% corrisponde alla retta ai minimi quadrati. Per fare questo verificare che
% i coefficienti presenti nel vettore alpha corrispondano a [m q] ottenuti
% calcolando la retta di regressione con la funzione retta_minq

g = 1;
A = assembla_mat_rettangolare(X_user, g);
alpha = inv(A'*A) * A' * Y_user;

[m q] = retta_minq(X_user', Y_user');

% Osservare perché sono stati passati i vettori trasposti (riga) alla
% funzione retta_minq. Cosa succede se si passano i vettori colonna? Per
% quale motivo?

%% Funzioni locali

function A = assembla_mat_rettangolare(X, g)
    A = nan(length(X), g+1);

    for i=1:g+1
        esponente = i-1;
        A(:,i) = X .^ esponente;
    end
end
