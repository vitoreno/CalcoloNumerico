% Andrea Marasciulo
%funzione per risolvere un sistema triangolare SUPERIORE
%M e V sono matrice e vettore di input; 
%S vettore soluzione.
function S = triSUP(M,V)
    n=length(V);
    S=zeros(n,1);
    
    if abs(M(n,n)<eps)
        error('Matrice singolare! Attenzione!');
    end
    
    S(n)=V(n)/M(n,n);
    for i=n-1:-1:1 %per k che va da n-1, con spostamento di -1 a ogni passo e che va fino a quando k=1.
        
        for j=i+1:n
            S(i)=V(i)-M(i,j)*S(j);
        end
        %equivale a: S(i)=V(i)-M(i,i+1:n)*S(i+1:n);
        if abs(M(k,k))<eps
            error('Matrice singolare! Attenzione!');
        else
            S(k)=S(k)/M(k,k);
        end
          
    end
return