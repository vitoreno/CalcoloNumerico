% Andrea Marasciulo
%Con questa funzione applico la fattorizzazione LU alla matrice A fornita;
%usando lo schema di DooLittle. (Calcolando alternamente con schema riga-colonna L ed U)
%
%L = avrà elementi diagonali pari a 1 e sarà triangolare inferiore
%
%U = sarà una matrice triangolare superiore
%
%
%
%

function [L,U] = Doolittle(A)
 [m,n] = size(A);
  U = zeros(n);            %crea a elementi tutti nulli la matrice nxn U.
  L = eye(n);              %creo una matrice identità di ordine n.
  U(1,:)=A(1,:);           %inizializza la prima riga di U pari alla prima riga di A (passo iniziale)
  
  for i=1:n-1                %il ciclo è impostato per i successivi n-1 passi e farà in ogni passo:
      for riga=i+1:n          %calcola successiva colonna di L
          L(riga,i) = (A(riga,i)-L(riga,1:i-1)*U(1:i-1,i))/U(i,i);
      end
      
      for colo=i+1:n            %calcolare successiva riga di U
          U(i+1,colo) = (A(i+1,colo)-L(i+1,1:i)*U(1:i,colo));
      end
  end
 %N.B: L'istruzione L(i,1:i-1) ad esempio, esegue la somma di tutti gli elementi con indice di riga i
 %      e indice di colonna che va da 1 a i-1.
return