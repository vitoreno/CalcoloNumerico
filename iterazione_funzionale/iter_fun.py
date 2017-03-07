import math


f = lambda x: math.e**(-x)
epsilon = 1e-8
max_iter = 10000

x_old = 0.01
x_new = f(x_old)
idx = 0
while(abs(x_old - x_new) > epsilon or idx > max_iter):
    x_old = x_new
    x_new = f(x_old)
    print 'Iterazione {0} - {1}'.format(idx, x_new)
    idx += 1