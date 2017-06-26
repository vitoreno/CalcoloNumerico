% Andrea Marasciulo
%Con questa funzione applico la fattorizzazione LU alla matrice A fornita;
%usando lo schema di Craut. (Calcolando alternamente riga per riga L ed U)
%
%L = avrà elementi diagonali pari a 1 e sarà triangolare inferiore
%
%U = sarà una matrice triangolare superiore
%
%
%
%

function [L,U] = Crout(A)
 [m,n] = size(A);
  U = zeros(n);            %crea a elementi tutti nulli la matrice nxn U.
  L = eye(n);              %creo una matrice identità di ordine n.
  U(1,:)=A(1,:);           %inizializza la prima riga di U pari alla prima riga di A (passo 1)
  
  for i=2:n                %il ciclo è impostato per i successivi n-1 passi e farà in ogni passo:
      for j=1:i-1          %calcola successiva riga di L
          L(i,j) = (A(i,j)-L(i,1:j-1)*U(1:j-1,j))/U(j,j);
      end   
      
      for j=i:n            %calcolare successiva riga di U
          U(i,j) = (A(i,j)-L(i,1:i-1)*U(1:i-1,j));
      end
  end
 %N.B: L'istruzione L(i,1:i-1) ad esempio, esegue la somma di tutti gli elementi con indice di riga i
 %      e indice di colonna che va da 1 a i-1.
return