% Main function for A rectangular time-scaled pulse
fs = 1000;
Ts = 1/fs;

t = -5:Ts:5;

x3 = rect(t/2);
plot(t,x3);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_3(t)');
title('Plot 3: A rectangular time-scaled pulse');