function z = lagrange(x, y, x1)

n = length(x);
m = length(x1);
z = zeros(1,m);

for i=1:m
    
    for j=1:n
        p = 1;
        for k=1:n
            if j ~= k
                p = p * (x1(i) - x(k)) / (x(j) - x(k));
            end
        end
        
        z(i) = z(i)+ y(j) * p;
    end

end

end