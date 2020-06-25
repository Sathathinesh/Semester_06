% Main function for A rectangular time-delayed pulse
fs = 1000;
Ts = 1/fs;

t = -5:Ts:5;

x2 = rect(t-1);
plot(t,x2);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_2(t)');
title('Plot 2: A rectangular time-delayed pulse');