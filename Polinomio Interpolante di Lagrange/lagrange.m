% Andrea Marasciulo
%Test:
%
%x=[-4; -3; 0; 1; 4; 5];
%y=[-1; 3; 4; 5; -3; 7];
%a= min(x);
%b= max(x);
%x1= linspace(a,b,200);
%y1= lagrange(x,y,x1);
%plot(x1,y1,'r',x,y,'o');



%Algoritmo con sintassi più compatta per valutare il polinomio di lagrange.
%
%Funzione che mi calcola il polinomio di lagrange.
%
%Input:   nx : vettore dei nodi,
%         ny : vettore contenente le ordinate dei nodi
%         px : vettore delle ascisse in cui poi calcolare il polinomio
%       
%Output:  py : vettore delle ordinate del polinomio interpolato valutate
%              nelle ascisse px.
%
%In questo modo, avrò punti estrapolati con coordinate rispettive contenute nel vettore px (ascisse)         
%e in py (ordinate).
%
%
function py = lagrange(nx,ny,px);

dimX = length(nx);
dimPX = length(px);
py = zeros(size(px));

%in questo for, estrapolerò i valori della mia funzione interpolata (calcolandola banalmente negli dimPX punti)
for i=1:dimPX
      py(i)=0;
      %ciclo per la sommatoria che va fino alla dimensione dei nodi, alla
      %fine di ognuno di questi cicli for avrò il valore di py(i);
      for k=1:dimX 
                                  %qui escludo il k-esimo 
                                  %elemento del vettore delle ascisse dei nodi  
                                          %|
                                          %|
                                          %V
        py(i) = py(i)+prod((px(i)-nx([1:k-1,k+1:dimX]))./(nx(k)-nx([1:k-1,k+1:dimX])))*ny(k); 
        %in questo modo sommo passo passo i polinomi fondamentali di
        %Lagrange valutati nei nei punti di ascisse appartenenti al vettore
        %px, moltiplicati alla corrispondente ordinata nel nodo; al fine di
        %valutare l'ordinata rispettiva dei punti di ascissa nel vettore px
        %(che sono incogniti)
      end
end


return



