%formula di Simpson composta
function Integrale=simpson_composta(f,a,b)
n=100;      %numero di intervalli (numero pari)
h=(b-a)/n;  %ampiezza singolo intervallo
temp1=0;
temp2=0;
%il seguente ciclo è per calcolare la prima sommatoria della formula
%in particolare vengono sommata tutti gli elementi con indice '2i' con i!=0
k=a;
for i=1:(n/2-1)
    k=k+2*h;
    temp1=f(k)+temp1;
end
%il seguente ciclo è per calcolare la seconda sommatoria della formula
%in particolare vengono sommati tutti gli elementi con indice '2i+1'
k=a+h;
for i=0:(n/2-1)
    temp2=f(k)+temp2;
    k=k+2*h;
end

Integrale= (h/3)*(f(a)+f(b)+2*temp1+4*temp2); %formula di Simpson composta       