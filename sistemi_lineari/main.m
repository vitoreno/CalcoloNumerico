clear
%questo programma risolver� sistemi di equazioni lineari di 
%N incognite in N equazioni.
%L'utente dovr� scegliere se inserire una matrice triangolare
%superiore o inferiore o una matrice quadrata non triangolare
%In quest'ultimo caso si utilizzer� il metodo di Eliminazione di Gauss 
%(con una strategia di Pivoting parziale) per rendere la matrice A 
%una matrice triangolare superiore e si applicher� il solito
%metodo di risoluzione di sistemi triangolari

%Esempi per il Metodo di Eliminazione di Gauss:
%scelta=3;
%N=4;
%A=[2 1 1 0;-6 -4 -5 1; -4 -6 -3 -1; 2 -3 7 -3];
%b=[-1 1 2 0];
%oppure
%N=3;
%A = [2 1 3; 1 4 -2; 3 -2 6];
%b = [0 7 2];
%scelta=3;


%Stampa le scelte che l'utente pu� fare
disp('Tipo di matrice da inserire');
disp('1 - Matrice Triangolare Superiore');
disp('2 - Matrice Triangolare Inferiore');
disp('3 - Matrice Quadrata non Triangolare')
scelta=input('Inserire quindi la scelta: ');
while scelta<1 || scelta>3
        scelta=input('Reinserire la scelta: ');
end
N=input('Inserire ordine matrice A: ');
[A,b]=InserimentoMatrice(N,scelta);
fprintf('\n');
disp('Il sistema di equazioni da risolvere � il seguente:'); 
visualizzaequazione(N,A,b); %visualizza il sistema di equazioni
disp('La matrice A dei coefficienti �:');
disp(A);
disp('Il vettore dei termini noti �:');
disp(b');
if det(A)==0 %effettua controllo sul determinante di A
        disp('La matrice inserita ha determinante pari a 0');
else
    if scelta==1 %Scegliendo 1 risolver� direttamente il sistema triangolare.
        X=SoluzioneTriangolareSup(N,A,b);
    elseif scelta==2 %Scegliendo 2 risolver� direttamente il sistema triangolare.
        X=SoluzioneTriangolareInf(N,A,b);
    elseif scelta==3 %Scegliendo 3 trasformer� A in una matrice triangolare e proceder� 
                     %con la risoluzione del sistema triangolare superiore
                     %equivalente al sistema di partenza.
        A2=A; %opero su una copia della matrice di partenza in modo da conservare i dati iniziali
        b2=b; %copia vettore termini noti
        [A2,b2]=EliminazioneDiGauss(N,A2,b2);
        disp('La matrice A triangolare superiore equivalente alla matrice A di partenza:');
        disp(A2);
        disp('Il nuovo vettore b dei termini noti �');
        disp(b2');
        X=SoluzioneTriangolareSup(N,A2,b2);
    end
    disp('Il vettore soluzione X:');
    disp(X);
    if (A*X')==b' %controllo che la soluzione sia corretta
        disp('Problema risolto');
    else
        disp('Soluzione errata, sistema non ammette soluzioni');
    end
end





