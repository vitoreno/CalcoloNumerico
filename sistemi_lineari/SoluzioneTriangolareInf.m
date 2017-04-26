function X=SoluzioneTriangolareInf(N,A,b)
%metodo di sostituzione in avanti
%ricavo il primo elemento di X
%e si procede in avanti trovando tutti gli N risultati sino ad arrivare
%al n-esimo elemento soluzione di X
X(1)=b(1)/A(1,1);
for i=2:N
    Sommatoria=0;
    for j=1:i-1
        Sommatoria=Sommatoria+(A(i,j)*X(j));%somma di tutti gli elementi moltiplicati 
                                            %per la loro incognita a
                                            %partire dall elemento 1 sino
                                            %all'i-1 esimo elemento
        
    end
    X(i)=(b(i)-Sommatoria)/A(i,i); %ricavol'i-esimo elemento di X
end
end
       