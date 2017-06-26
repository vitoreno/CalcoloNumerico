function [M,V,SC]=gaussPT(M,V)
% Andrea Marasciulo
% Sintassi S=gauss(M,V)
%
% Risolve un sistema LINEARE usando il metodo di Gauss con pivoting totale.
% ~
% Parametri di input:
% M = Matrice dei coefficienti
% V = Vettore dei termini noti
% 
% Parametri di output:
% M,V = Matrice e vettore triangolarizzati.
% SC = Vettore che memorizza gli scambi effettuati e gli indici rispettivi,
%      in caso di scambio di colonne nel metodo di pivoting totale, che
%      pertuberanno il vettore soluzione in seguito alla risoluzione del
%      sistema
% 

[m,n]=size(M);
indice = [1:n];

    if m~=n
         error('Metodo non applicabile');
    end
         if length(V)~=n
               error('Metodo non applicabile');
         end
 for k=1:n-1
   if abs(M(k,k))<eps
        error('Elemento pivotale nullo');
   end
      [M,V,indice]=pivotingTOTALE(M,V,indice,k);   
   
      for i=k+1:n
         Molt=M(i,k)/M(k,k);
         
         for j=k:n
            M(i,j)=M(i,j)-Molt*M(k,j); 
         end
         V(i)=V(i)-Molt*V(k);
      end
      
 end
return