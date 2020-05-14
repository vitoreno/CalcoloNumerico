clear all
close all
clc

figure, hold on
xlim([-100 100])
ylim([-100 100])

[X_in Y_in] = getpts;

plot(X_in, Y_in, 'rx');

iters = length(X_in);
for i=2:iters
   [X Y] = myspline(X_in(i), Y_in(i), X_in(i-1), Y_in(i-1));
   plot(X,Y)
end