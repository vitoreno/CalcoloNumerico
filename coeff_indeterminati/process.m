clear all
close all
clc

pts = dlmread('punti.csv');

% V = fliplr(vander(pts(:,1)));
n = size(pts,1);
V = ones(n);
for k=2:n
    V(:,k) = pts(:,1).^(k-1);
end

a = V\pts(:,2);

X = -2:0.2:8;

% Y = a(1) + a(2)*X + a(3)*X.^2;
Y = (X * 0) + a(1);
for k=2:n
    Y = Y + a(k)*X.^(k-1);
end

figure, hold on
plot(pts(:,1), pts(:,2), 'rx')
plot(X,Y)



