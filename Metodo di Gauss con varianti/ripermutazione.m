% Andrea Marasciulo
%funzione da utilizzare dopo aver risolto un sistema lineare usando il
%metodo di Gauss con pivoting totale. (in quando scambi tra colonne permutano il vettore soluzione del sistema lineare.)
%input:     S = vettore soluzione da ripermutare;
%       index = vettore di grandezza pari al numero di scambi tra colonne
%               effetuati, che registra i vari indici che sono stati scambiati.


function S = ripermutazione(S,index)
       N=length(S);
       S2=S;
       for i=1:N
           S2(index(i))=S(i);
       end

return