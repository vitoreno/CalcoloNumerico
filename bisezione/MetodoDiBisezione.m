% Esempio di metodo di bisezione
% Prima versione: Giovanni Soleti <g.soleti@studenti.poliba.it>

I=0; %input('Inserire valore inizio del dominio ');
F=10; %input('Inserire valore fine dominio ');
A=0.5; %input('Inserire punto di partenza intervallo ');
B=2; %input('Inserire punto di fine intervallo ');
while (funzione2(A)*funzione2(B))>=0 || (A<I || A>F)|| (B<I || B>F)
    A=input('Reinserire il valore di partenza intervallo ');
    B=input('Reinserire il valore di fine intervallo ');
end

% Visualizzazione dei dati
f_h = figure;
hold on;
x = I:0.01:F;
y = funzione2(x);
plot(x, y);
plot(x, y*0, 'r');
y_low = -3;
y_high = 3;
line([A; A], [y_low; y_high],'Color', 'g', 'LineStyle','--');
line([B; B], [y_low; y_high],'Color', 'g', 'LineStyle','--');
ylim([y_low, y_high]);

Eps=1e-5; %input('Inserire errore massimo ');
C=(A+B)/2;
V = funzione2(C);

plot(C, 0, 'k.', 'MarkerSize', 10);
while abs(V)>Eps
    if funzione2(A)*funzione2(C)<0
       B=C;
       C=(A+B)/2;
    else
        A=C;
        C=(A+B)/2;
    end
    plot(C, 0, 'k.', 'MarkerSize', 10);
    V = funzione2(C);
end
plot(C, 0, 'kx', 'MarkerSize', 10);
fprintf('La radice è %d\n',C);


function v = funzione2(x)
    v = log(x);
end
