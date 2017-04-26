function [A,b]=EliminazioneDiGauss(N,A,b)
disp('Tipo di Pivoting');
disp('1 - Pivoting Parziale');
disp('2 - Pivoting Totale');
disp('3 - Non effettuare Pivoting');
scelta2=input('Inserire quindi la scelta: ');
while scelta2<1 || scelta2>3
    scelta2=input('Reinserire la scelta: ');
end
for k=1:N-1 %contatore dei passi
    if scelta2==1
    [A,b]=PivotingParziale(A,b,k,N); %ricercherà l elemento più grande all'interno
                                     %della k-esima colonna e effettuerà
                                     %opportuni scambi
    elseif scelta2==2
    [A,b]=PivotingTotale(A,b,k,N); %ricercherà l elemento più grande all'interno
                                   %della sottomatrice di A di ordine k e effettuerà
                                   %opportuni scambi 
    end
    
    
    for i=k+1:N %contatore righe
        molt=A(i,k)/A(k,k); %calcolo del moltiplicatore 
        for j=k:N %contatore colonne
           A(i,j)=A(i,j)-(molt)*A(k,j); %esegue combinazione lineare 
                                        %su ogni elemento di A 
                                        %a partire dall elemento che si trova
                                        %nella k+1 esima riga e k colonna
                                     
        end
        b(i)=b(i)-molt*b(k); %esegue combinazione lineare su ogni elemento 
                             %di b a partire dalla posizione k+1
    end
end
