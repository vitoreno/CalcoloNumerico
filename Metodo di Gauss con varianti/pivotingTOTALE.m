% Andrea Marasciulo
%pivoting totale per il metodo di Gauss.

function [M,V,indice] = pivotingTOTALE(M,V,indice,k) 
       n=length(indice);
       [a,riga] = max(abs(M(k:n,k:n)));
       [mass,col] = max(a);
       j = col+k-1;
       i = riga(col)+k-1;
       if i~=k                            %blocco per lo scambio fra righe;
           M([i k],:) = M([k i],:);   
           V([i k]) = V([k i]);
       end
       if j~=k                            %blocco per lo scambio fra colonne,  
           M(:,[j k]) = M(:,[k j]);       %il vettore 
           indice([j k]) = indice([k j]);
       end
return