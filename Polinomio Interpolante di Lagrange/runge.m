% Andrea Marasciulo
%esercitazione sul fenomeno di runge, uso in ipotesi la funzione f(x)=1/(1+x^2)

function runge(a,b,n)

%input:   a: estremo destro intervallo
%         b: estremo sinistro intervallo
%         n: numero dei nodi

%con questa funzione visualizzo due grafici; 
%quello in rosso � la funzione interpolata;
%mentre quello in blu � il polinomio interpolante (gi� noto, per evidenziare l'oscillazione)
%infine i cerchi neri sono i nodi di interpolazione

funz=inline('1./(x.^2+1)');
xf=linspace(a,b,n);
yf=feval(funz,xf);
x1=linspace(a,b,100);
y2=feval(funz,x1);
y1=lagrange(xf,yf,x1);
plot(xf,yf,'ko',x1,y2,'r',x1,y1,'b');
return

%osservazioni, pi� aumentano i nodi, pi� � preciso! 
%(Almeno per la funzione in questione, in quanto nell'espressione dell'errore 
%prevarr� il fattoriale al denominatore alla derivata al numeratore)

