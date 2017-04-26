function [A,b]=InserimentoMatrice(N,scelta)
for i=1:N
    for j=1:N 
        if scelta==1 && j<i %se l'utente ha scelto di inserire una matrice triangolare 
                     %superiore allora verranno inseriti in automatico
                     %gli zeri al di sotto della diagonale
                A(i,j)=0;
        elseif scelta==2 && i<j %se l'utente ha scelto di inserire una matrice triangolare 
                     %inferiore allora verranno inseriti in automatico
                     %gli zeri al di sopra della diagonale
                A(i,j)=0;
        else
            fprintf('inserire coefficiente della %i incongnita nella %i equazione: ',j, i);
            A(i,j)=input('');
        end
    end
    fprintf('inserire termine noto della %i equazione: ', i);
    b(i)=input('');
end
