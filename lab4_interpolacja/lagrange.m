function [x_min, iter] = lagrange(f, a, b, c, eps, gamma, max_iter)
% a, b - krawędzie przedziału
% c - punkt pośredni
% eps, gamma - dokładność
    i = 1;

    d(i) = 1/2 * ((f(a(i)) * ( c(i)^2 - b(i)^2 ) + ...
                       f(c(i)) * ( b(i)^2 - a(i)^2 ) + ...
                       f(b(i)) * ( a(i)^2 - c(i)^2 ) ) / (...
                       f(a(i)) * ( c(i) - b(i) ) + ...
                       f(c(i)) * ( b(i) - a(i) ) + ...
                       f(b(i)) * ( a(i) - c(i) ) ) );

    while true
        if a(i) < d(i) && d(i) < c(i)
            if f(d(i)) < f(c(i))
                a(i+1) = a(i);
                c(i+1) = d(i);
                b(i+1) = c(i);
            else
                a(i+1) = d(i);
                c(i+1) = c(i);
                b(i+1) = b(i);
            end
        else
            if c(i) < d(i) && d(i) < b(i)
                if f(d(i)) < f(c(i))
                    a(i+1) = c(i);
                    c(i+1) = d(i);
                    b(i+1) = b(i);
                else
                    a(i+1) = a(i);
                    c(i+1) = c(i);
                    b(i+1) = d(i);
                end
            else
                error("Algorytm nie jest zbieżny!")
            end
        end

        i = i + 1;

        d(i) = 1/2 * ((f(a(i)) * ( c(i)^2 - b(i)^2 ) + ...
               f(c(i)) * ( b(i)^2 - a(i)^2 ) + ...
               f(b(i)) * ( a(i)^2 - c(i)^2 ) ) / (...
               f(a(i)) * ( c(i) - b(i) ) + ...
               f(c(i)) * ( b(i) - a(i) ) + ...
               f(b(i)) * ( a(i) - c(i) ) ) );

        if i > max_iter
            error("Nie udało się osiągnąć dokładności eps!")
        end

        if b(i) - a(i) < eps || abs(d(i) - d(i-1)) <= gamma
            break;
        end
    end
    
    x_min = d(i);
    iter = i;

    return
end