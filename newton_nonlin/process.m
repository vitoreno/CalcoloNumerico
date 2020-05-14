clear all
X = [-5:0.2:5];
Y1 = X.^2 - 4;
Y2 = X .^3 + 12;

figure
hold on

plot(X, Y1)
plot(X, Y2)

bLoop = true;
iter = 0;
tol = 1e-2;
x_star = [2;0];
plot(x_star(1), x_star(2), 'rx')

while bLoop
    x_old = x_star;
    J = [2*x_star(1), -1 ; 3*x_star(1)^2, -1];
    x_star = x_star - inv(J) * [x_star(1)^2 - x_star(2) - 4 ; x_star(1)^3 - x_star(2) + 12];

    plot(x_star(1), x_star(2), 'kx')
    
    if (abs(x_old - x_star) < tol)
        bLoop = false;
    end
    
    iter = iter + 1;
end

x_star
[x_star(1)^2 - x_star(2) - 4 ; x_star(1)^3 - x_star(2) + 12]

iter