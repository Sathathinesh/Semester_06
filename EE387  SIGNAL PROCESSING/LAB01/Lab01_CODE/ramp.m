%Function for Ramp signal function
% t = length of time
% m = slope of the ramp function
% ad = advance (positive), delay (negative) factor

function y = ramp(t,m,ad)

n = length(t);
y = zeros(1,n);
for i = 1:n,
    if t(i)>= -ad,
    y(i) = m*(t(i) + ad);
    end
    
end
