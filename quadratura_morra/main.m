% Codici sviluppati da Antonio MORRA

%in questo codice si prova ad approssimare l'integrale di una funzione con
%tutti i metodi che sono stati studiati
% si osservi come al variare dei nodi vari la precisione

a=0.5;                      %estremo inferiore
b=2;                        %estremo superiore
f=@(x) (1./(1+x.^6));       %funzione in considerazione

Integrale_reale=integral(f,a,b) % risultato dell'integrale fornito da Matlab

Integrale_trapezi=trapezi(f,a,b) %formula dei trapezi semplice
Integrale_trapezi_composta=trapezi_composta(f,a,b) %formula dei trapezi composta

Integrale_simpson=simpson(f,a,b)%formula di simpson semplice
Integrale_simpson_composta=simpson_composta(f,a,b)%formula di simpson composta

Integrale_punto_di_mezzo=punto_di_mezzo(f,a,b)%formula integrale del punto di mezzo
Integrale_punto_di_mezzo_composta=punto_di_mezzo_composta(f,a,b)% formula integrale del punto di mezzo composta
