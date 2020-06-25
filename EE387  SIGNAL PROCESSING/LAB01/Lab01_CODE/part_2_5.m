fs = 1000;
Ts = 1/fs;
t = -5:Ts:5;

x1 = rect(t);

close all;
y = conv(x1, x1);
%plot(t, y)

length(y)
length(t)

ty = -10:Ts:10;
%plot(ty, y)

y1 = Ts * conv(x1, x1);

plot(ty, y1);
axis([-2 2 -1 2]);
xlabel('time (sec)');
ylabel('y_1(t)');
title('Figure : y_1(t) = x_1(t) * x_1(t)');