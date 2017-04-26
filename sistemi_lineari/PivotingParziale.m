function [A,b]=PivotingParziale(A,b,k,N)
max=0;
posmax=0;
%ricerca elemento maassimo 
 for y=k:N %controllo su tutti gli elementi della k-esima colonna
     if A(y,k)>max
         max=A(y,k); 
         posmax=y; %salva il numero della riga dell'elemento maggiore 
     end
 end
 if posmax~=k %se l elemento più grande non si trova nella k-esima riga esegue scambio
         temp_row = A(posmax, :);
         A(posmax, :) = A(k, :);
         A(k, :) = temp_row;
         %scambio elementi di b
         temp=b(posmax);
         b(posmax)=b(k);
         b(k)=temp;
    end
end

         
     