function [x_out, i] = kar_wew(f, x_start, c, ogr_a, ogr_b, eps)
% eps > 0; ogr_a < ogr_b, c > 0
    x(1) = x_start;
    i = 1;
    % Funkcja kary zewnętrznej na funkcjach liniowych
    g1 = @(x) -x + ogr_a;
    g2 = @(x) x - ogr_b;
    S = @(x) -1 * (log(-g1(x)) + log(-g2(x)));
    figure; hold on; grid on;
    drawnow();
    fplot(f, [ogr_a, ogr_b], LineWidth=3);
    while true
        i = i + 1;
        F_i = @(x) f(x) + c * S(x);
        drawnow();
        fplot(F_i, "--r");
        x(i) = fminsearch(F_i, x(i - 1));
        drawnow(); plot(x(i), F_i(x(i)), 'r*');
        c = 0.5 * c;

        if norm(x(i) - x(i - 1), 2) < eps
            break;
        end
    end
    hold off;
    x_out = x(i);
    return;
end