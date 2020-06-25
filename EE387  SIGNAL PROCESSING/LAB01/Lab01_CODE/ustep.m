%Function for Unit Step functions
% t = length of time
% ad = advance (positive), delay (negative) factor

function y = ustep(t,ad)
n = length(t);
y = zeros(1,n);
for i = 1:n,
    if t(i)>= -ad
    y(i) = 1;
    end
end