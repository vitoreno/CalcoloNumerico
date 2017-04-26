function [A,b]=PivotingTotale(A,b,k,N)
max=0;
posRigaMax=0;
posColonnaMax=0;
 for y=k:N %controllo su tutti gli elementi della matrice di ordine k
     for z=k:N
         if A(y,z)>max
            max=A(y,z); 
            posRigaMax=y;  %salva il numero della riga e della colonna dell'elemento maggiore 
            posColonnaMax=z;
         end
     end
 end
 if max~=A(y,z) %se l elemento più grande non si trova nella k-esima riga e k-esima colonna
        %scambio prima le righe    
        temp_row = A(posRigaMax, :);
         A(posRigaMax, :) = A(k, :);
         A(k, :) = temp_row;
         %scambio elementi di b
         temp=b(posRigaMax);
         b(posRigaMax)=b(k);
         b(k)=temp;
         %ora scambio le colonne
         temp_row = A(:,posColonnaMax);
         A(:,posColonnaMax) = A(:,k);
         A(:,k) = temp_row;
end