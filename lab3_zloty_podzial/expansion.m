function [a, b, i] = expansion(f, x0, x1, alfa, Nmax)

x0 = x0;
i = 0;
if f(x0) == f(x1)
    a = x0;
    b = x1;
    return
end

if f(x1) > f(x0)
    x1 = -1*(x1 - x0) + x0;
    if f(x1) == f(-1*(x1 - x0) + x0)
        a = -1*(x1 - x0) + x0;
        b = x1;
        return
    end
end

x2 = x1;
x1 = x0;
while f(x1) > f(x2)
    if i > Nmax
        a = -inf;
        b = inf;
        return 
    end
    i = i + 1;
    x0 = x1;
    x1 = x2;
    x2 = alfa * (x2 - x0) + x0;
end

if x0 < x2
    a = x0;
    b = x2;
    return
end
a = x2;
b = x0;
return;
end