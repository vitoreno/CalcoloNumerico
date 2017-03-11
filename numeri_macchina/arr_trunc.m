% Esempio di arrotondamento e Troncamento

x = 0.4627;

fprintf('Numero di partenza: %f \n', x);
for n_cifre = 1:4

    x_arr = round(x*10^n_cifre)/10^n_cifre;
    x_trunc = floor(x*10^n_cifre)/10^n_cifre;

    
    fprintf('Arrotondamento a %d cifre decimali: %f \n', n_cifre, x_arr);
    fprintf('Troncamento a %d cifre decimali: %f \n \n', n_cifre, x_trunc);
end