function [M,V]=gauss(M,V)
% Andrea Marasciulo
% Sintassi S=gauss(M,V)
%
% Risolve un sistema LINEARE usando il metodo di Gauss con pivoting
% parziale.
% ~
% Parametri di input:
% M = Matrice dei coefficienti
% V = Vettore dei termini noti
% 
% Parametri di output:
% M,V = Matrice e vettore triangolarizzati.
%
[m,n]=size(M);
    if m~=n
         error('Metodo non applicabile');
    end
         if length(V)~=n
               error('Metodo non applicabile');
         end
 for k=1:n-1
   %[M,V]=pivotingPARZIALE(M,V,k);    %esegue il pivoting parziale, su ogni colonna k fino alla penultima
                                     %per agevolare il calcolo del
                                     %moltiplicatore  
       
   if abs(M(k,k))<eps
        error('Elemento pivotale nullo');
   end
      
      for i=k+1:n
         Molt=M(i,k)/M(k,k);         
         for j=k:n
            M(i,j)=M(i,j)-Molt*M(k,j); 
         end
         V(i)=V(i)-Molt*V(k);
      end
      
 end
return
      