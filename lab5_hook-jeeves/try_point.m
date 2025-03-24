function x_out = try_point(f, x, step)
    direction_versors = [1 0; 0 1; -1 0; 0 -1]';
    for versor = direction_versors
        if f(x + step .* versor) < f(x)
            x = x + step .* versor;
        else
            if f(x - step .* versor) < f(x)
                x = x - step .* versor;
            end
        end
    end
    x_out = x;
    return;
end