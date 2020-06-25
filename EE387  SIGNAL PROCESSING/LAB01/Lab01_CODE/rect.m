% Function for rectangular pulse
function x = rect(t)

n = length(t);
x = zeros(1, n);

    for i = 1:n

       if t(i) >= -0.5 && t(i) < 0.5

          x(i) = 1;

       end

    end

end


