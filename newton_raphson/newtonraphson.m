function [xk, k] = newtonraphson(xk, params)
    f = params.f;
    delta = 0.01;
    
    if nargin == 1
        params.plot_data = false;
        params.r = 1;
        params.max_iter = 100;
        params.toll = 1e-8;
        params.delay = 0.2;
    end
    
    if params.plot_data
        params.Y = f(params.X);
        f_h = figure;
        hold on;
        plot(params.X, params.Y);
        plot(params.X, params.X*0, 'g');
        h1 = line('Visible', 'Off');
    end
    
    k = 0;
    err = 2*params.toll;
    f_xk = f(xk);
    
    while (err > params.toll || abs(f_xk) > params.toll) && k < params.max_iter
        f1_xk = (f(xk+delta) - f(xk-delta)) / (2*delta);
        xk1 = xk - params.r*f_xk/f1_xk;
        err = abs(xk1 - xk);
        
        if params.plot_data
            title(['Iterazione ', num2str(k)])
            x_a = xk-1;
            y_a = f(xk) + f1_xk * (x_a - xk);

            x_b = xk+1;
            y_b = f(xk) + f1_xk * (x_b - xk);
            
            h1.Visible = 'Off';
            h1 = plot([x_a x_b], [y_a, y_b], 'r--');
            
            h2 = plot(xk, f_xk, 'r.', 'MarkerSize', 15);
            
            pause(params.delay);
        end
        
        k = k+1;
        xk = xk1;
        f_xk = f(xk);
    end
    
    if k == params.max_iter
        error('Il metodo non converge.');
    end
    
    if params.plot_data
        title(['Iterazione ', num2str(k)])
        h2 = plot(xk, f_xk, 'k.', 'MarkerSize', 15);
    end
end

