function [x_out, iter] = z_podz(f, a, b, eps, max_iter)
    i = 1;
    alfa = (sqrt(5) - 1) / 2;
    c(1) = b(1) - alfa * (b(1) - a(1));
    d(1) = a(1) + alfa * (b(1) - a(1));

    while true
        if f(c(i)) < f(d(i))
            a(i + 1) = a(i);
            b(i + 1) = d(i);
            d(i + 1) = c(i);
            c(i + 1) = b(i + 1) - alfa * (b(i + 1) - a(i + 1));
        else
            a(i + 1) = c(i);
            b(i + 1) = b(i);
            d(i + 1) = a(i + 1) + alfa * (b(i + 1) - a(i + 1));
            c(i + 1) = d(i);
        end
        i = i + 1;
        if i > max_iter
            error("Nie udało się znaleźć rozwiązania w max_iter krokach!")
        end
        if abs(b(i) - a(i)) < eps
            break
        end
    end

    x_out = (a(i) + b(i)) / 2;
    iter = i;
    return
end