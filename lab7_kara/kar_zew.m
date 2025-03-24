function [x_out, i] = kar_zew(f, x_start, c, ogr_a, ogr_b, eps)
% eps > 0; ogr_a < ogr_b, c > 0
    % syms xs
    x(1) = x_start;
    i = 1;
    % Funkcja kary zewnętrznej na funkcjach liniowych
    g1 = @(x) -x + ogr_a;
    g2 = @(x) x - ogr_b;
    S = @(x) max(0, g1(x)) ^ 2 + max(0, g2(x)) ^ 2;
    while true
        i = i + 1;
        F_i = @(x) f(x) + c * S(x);
        x(i) = fminsearch(F_i, x(i - 1));
        c = 2 * c;

        if norm(x(i) - x(i - 1), 2) < eps
            break;
        end
    end
    
    x_out = x(i);
    return;
end