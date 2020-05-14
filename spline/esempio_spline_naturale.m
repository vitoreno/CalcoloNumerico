% tre punti

Pts = [1 2; 5 5; 7 3];

p0 = Pts(1,:);
p1 = Pts(2,:);
p2 = Pts(3,:);

A = [   [p0(1)^3 p0(1)^2 p0(1) 1 ; ...
         p1(1)^3 p1(1)^2 p1(1) 1 ; ... 
         3*p0(1)^2 2*p0(1) 1 0 ; ...
         3*p1(1)^2 2*p1(1) 1 0 ;] ,     zeros(4,4) ; ...
         zeros(4,4),    [p1(1)^3 p1(1)^2 p1(1) 1 ; ...
                         p2(1)^3 p2(1)^2 p2(1) 1 ; ... 
                         3*p1(1)^2 2*p1(1) 1 0 ; ...
                         3*p2(1)^2 2*p2(1) 1 0 ;] ];

b = [p0(2), p1(2), 0, 0, p1(2), p2(2), 0, 0]';

coeff = A\b;

X1 = [p0(1):0.1:p2(1)];
Y1 = coeff(1).*X1.^3 + coeff(2).*X1.^2 + coeff(3).*X1 + coeff(4);
Y2 = coeff(5).*X1.^3 + coeff(6).*X1.^2 + coeff(7).*X1 + coeff(8);

figure, hold on
plot(Pts(:,1), Pts(:,2), 'rx');
plot(X1, Y1, 'b--');
plot(X1, Y2, 'g--');
axis equal