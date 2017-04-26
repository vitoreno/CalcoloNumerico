function visualizzaequazione(N,A,b) %algoritmo che mi permette di visualizzare il sistema di equazioni
for i=1:N
    if A(i,1)~=0
    fprintf('%dx1',A(i,1));
    end
    for j=2:N
        if A(i,j)>0 %se il numero � maggiore di 0 dovr� inserire il segno '+' solo se ci sono altri numeri prima
            noncisonozeri=false;
            for z=j-1:-1:1 %controllo su tutti i primi j-1 termini, se sono tutti 0 non inserisco il segno '+' 
                if A(i,z)~=0
                    noncisonozeri=true;
                    break
                end
            end
            if noncisonozeri==true %se almeno uno � diverso da 0 inserisco il segno '+'
                fprintf('+');
                fprintf('%dx%d',A(i,j), j);
            else
                fprintf('%dx%d',A(i,j), j)
            end
        elseif A(i,j)<0 %se il numero � negativo scriver� il numero col segno '-'
            fprintf('%dx%d',A(i,j), j)
        end
    end
            
    fprintf(' = %d \n',b(i)); %stampa termine noto e il segno '='
end
fprintf('\n');
end