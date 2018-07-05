%formula di Simpson
function Integrale=simpson(f,a,b) 
h=(b-a)/2;
c=(a+b)/2; %punto medio dell'intervallo
Integrale= (h/3)*(f(a)+4*f(c)+f(b)); %formula di Simpson semplice        