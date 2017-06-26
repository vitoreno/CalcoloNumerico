% Andrea Marasciulo
%funzione che esegue il pivoting parziale da usare eventualmente nel metodo
%di Gauss in ogni passo prima di calcolare il moltiplicatore
%parametri in input:
%m : matrice iniziale del sistema lineare incompleta
%v : vettore dei termini noti
%k : k-esima colonna su cui si effettua l'operazione, si ripeter� al pi� per
%    le m colonne della matrice del sistema
function [M,V] = pivotingPARZIALE(m,v,k) 
     n = length(v);
     M=m;
     V=v; 
           [p,i] = max(abs(M(k:n,k))); % p = � il valore numerico del pivot corrispondente con valore pi� alto,
                                       % i = � l'indice della posizione in cui
                                       %     si trova p.
                                       
            i=i+k-1;                   %ora va a segnare la riga;
            
            if i~=k                    
                M([i k],:) = M([k i],:);
                V([i k]) = V([k i]);                
            end
return

    

