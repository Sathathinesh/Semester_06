% Plot for the damped sinusoidal signal
clear all;

t = 0:1/1000:3;
x = 3 * exp(-t) .* cos(4 * pi * t);

subplot(2,1,1);
plot(t,x);
title('A Damped Sinusoidal Signal');

% We can use the command hilbert to find the envelope of a signal
r = abs(hilbert(x));
subplot(2,1,2);
plot(t,r);
title('Envelope of the Signal');