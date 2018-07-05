%formula dei trapezi
function Integrale=trapezi(f,a,b)
h=b-a;                        %intervallo considerato
Integrale= (h/2)*(f(b)+f(a)); %formula dei trapezi semplice

%creazione del grafico per vedere la curva reale e la retta di
%approssimazione che taglia il grafico
x=linspace(a-3,b+3,100);  %creo il vettore delle ascisse
y0=feval(f,x);            %creo il vettore delle ordinate
plot(x,y0,'b-');
hold on
t=@(x) ((f(b)-f(a))/(b-a))*(x-a)+f(a);  %funzione della retta passante per due punti
y1=feval(t,x);
plot(x,y1,'r-');
plot(a,f(a),'o',b,f(b),'o');            