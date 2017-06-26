function S=triINF(M,V)
% Andrea Marasciulo
% Risolve un sistema triangolare inferiore 
%
% input:
% M = Matrice triangolare inferiore
% V = Vettore colonna
%
% Parametri di output:
% S = Vettore soluzione
%
n=length(V);
S=zeros(n,1);
    if abs(M(1,1))<eps
       error('La matrice A e'' singolare');
    end
S(1)=V(1)/M(1,1);
    for k=2:n
        S(k)=V(k)-M(k,1:k-1)*S(1:k-1);
           if abs(M(k,k))<eps
                error('La matrice A e'' singolare');
           else
                S(k)=S(k)/M(k,k);
           end
    end
    return
