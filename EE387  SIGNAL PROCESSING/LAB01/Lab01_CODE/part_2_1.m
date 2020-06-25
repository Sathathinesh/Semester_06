% Main function for plotting time-delayed signal
fs = 1000;
Ts = 1/fs;

t = -5:Ts:5;

x1 = rect(t);
plot(t,x1);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_1(t)');
title('Plot 1: A rectangular pulse');