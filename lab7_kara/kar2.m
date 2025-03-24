function [x_out, i] = kar(f, x_start, c, S, eps, alfa)
% eps > 0; c > 0, S - funkcja kary
    x(1, :) = x_start;
    i = 1;
    figure;
    while true
        i = i + 1;
        F_i = @(x) -1 * ( f(x) + c * S(x) );
        x(i, :) = fminsearch(F_i, x(i - 1, :));
        c = alfa * c;

        %hold on;
        %fsurf(@(x1, x2) F_i([x1, x2]));
        %plot3(x(i - 1, 1), x(i - 1, 2), F_i(x(i - 1, :)) + 0.1, 'ro', "MarkerSize", 7, "MarkerFace", "r");
        %view([3 3 5]);
        %hold off;
        if norm(x(i, :) - x(i - 1, :), 2) < eps
            break;
        end
    end
    
    x_out = x(i, :);
    return;
end