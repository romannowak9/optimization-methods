function x_out = hook_jeeves(f, x, step, alpha, eps)
% x - punkt startowy
% alpha - (0; 1) - współczynnik zmniejszania długości kroku
% eps - dokładność
    while true
        x_base = x;
        x = try_point(f, x, step);  % Etap próbny

        if f(x) < f(x_base)
            while true
                n_x_base = x_base;
                x_base = x;
                x = 2 * x_base - n_x_base;  % Etap roboczy

                x = try_point(f, x, step);  % Krok etapu próbnego

            if f(x) >= f(x_base)
                break;
            end
            end
            x = x_base;  % powrót do porzedniej bazy
        else
            step = alpha * step;
        end

    if step < eps  % warunek stopu
        break;
    end
    end
    x_out = x_base;  % przybliżone rozwiązanie
    return;
end