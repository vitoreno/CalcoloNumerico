%formula del punto di mezzo composta
function Integrale=punto_di_mezzo_composta(f,a,b)
n=100; %intervalli di suddivisione (n pari) 
h=(b-a)/n;
temp=0;
k=a+h;
%il ciclo è per calcolare la somma degli elementi con indice '2i+1'
for i=0:(n/2-1)
   temp=temp+f(k);
   k=k+2*h;
end
Integrale= 2*h*temp; %formula del punto di mezzo    