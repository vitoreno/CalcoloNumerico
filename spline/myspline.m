function [X, Y] = myspline(x0, y0, x1, y1)
    xmin = min(x0, x1);
    xmax = max(x0, x1);
    
    passo = (xmax-xmin)/100;
    X = xmin:passo:xmax;
    
    C = [x0^3 x0^2 x0 1 ; ...
         x1^3 x1^2 x1 1 ; ... 
         3*x0^2 2*x0 1 0 ; ...
         3*x1^2 2*x1 1 0 ;];
    y = [y0;y1;0;0];
    
    coeff = C\y;
    Y = coeff(1).*X.^3 + coeff(2).*X.^2 + coeff(3).*X + coeff(4);
end