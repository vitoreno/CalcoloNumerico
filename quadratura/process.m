clear all
close all
clc

%si definisce una funzione di riferimento
X_ref = -10:0.2:10;
f = @(x) (x.^4 + x.^2);
Y_ref = f(X_ref);

f_h = figure;
hold on
plot(X_ref, Y_ref)
plot(X_ref, zeros(1, length(X_ref)), 'r')


%% Trapezi
a = -2;
b = 0;%X_ref(end);
h = b - a; % OSS: h in realtà non ci serve.

T = @(a, b) 0.5*(b - a)*(f(b) + f(a));
I1 = T(a,b);

stem(a, f(a), 'k')
stem(b, f(b), 'k')
plot([a b], [f(a) f(b)], 'k--')

%% Formula dei trapezi composta
% OSS: per definizione, si applica la formula T su un certo numero di sotto
% intervalli
N = 10;
h = (b - a) / N; % OSS: h in realtà non ci serve.

XX = a:h:b;
I2 = 0;
for i=1:N
    I2 = I2 + T(XX(i), XX(i+1));
    
    stem(XX(i), f(XX(i)), 'k')
    stem(XX(i+1), f(XX(i+1)), 'k')
    plot([XX(i) XX(i+1)], [f(XX(i)) f(XX(i+1))], 'k--')
end

%% Simpson
c = (a + b) / 2;
h = (b - a) / 2;

S = @(a, c, b) (0.5*(b - a)/3)*(f(a) + 4*f(c) + f(b));
I3 = S(a, c, b);

%% Formula di Simpson composta
N = 10;
h = (b - a) / N; % OSS: h in realtà non ci serve.

XX = a:h:b;
I4 = 0;
for i=1:N/2
    I4 = I4 + S(XX(2*i - 1), XX(2*i), XX(2*i + 1));
end

%%
I1

I2

I3

I4