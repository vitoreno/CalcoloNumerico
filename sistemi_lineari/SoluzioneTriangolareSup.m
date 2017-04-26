function X=SoluzioneTriangolareSup(N,A,b)
%metodo di sostituzione all'indietro
%risolvo l' n-esimo elemento di X
%e si procede all'indietro trovando tutti gli N risultati sino ad arrivare
%al primo elemento soluzione di X
X(N)=b(N)/A(N,N);
for i=N-1:-1:1
    Sommatoria=0; 
    for j=i+1:N
        Sommatoria=Sommatoria+(A(i,j)*X(j)); %somma di tutti gli elementi moltiplicati 
                                             %per la loro incognita a partire dall elemento i+1
    end
    X(i)=(b(i)-Sommatoria)/A(i,i); %ricavo la i-esima soluzione
end
end
        