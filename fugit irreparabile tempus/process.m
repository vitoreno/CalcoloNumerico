% Osservare il tempo di esecuzione

A = randi(25, 100, 100);

n = size(A,1);

tic
s = 0;
for i=1:n
    for j=1:n
        if i >= j
            s = s + A(i,j);
        end
    end
end
toc

s

tic
s = 0;
for i=1:n
    for j=1:i
        s = s + A(i,j);
    end
end
toc

s

tic
s = sum(sum(tril(A)))
toc

s

tic
sum(sum(tril(A)))
toc
