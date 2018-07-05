%formula dei trapezi composta
function Integrale=trapezi_composta(f,a,b)
n=100; % numero di intervalli di suddivisione della funzione
h=(b-a)/n;
k=a;
temp=0;
for i=1:n-1
    temp=f(k)+temp;
    k=k+h;
end
Integrale=(h/2)*(f(a)+f(b))+h*temp;