% All the plots in a single plot
fs = 1000;
Ts = 1/fs;
t = -5:Ts:5;

% Rectangular pulse
x1 = rect(t);
subplot(3,2,1)
plot(t,x1);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_1(t)');
title('Plot 1: A rectangular pulse');

% A rectangular time-delayed pulse
x2 = rect(t-1);
subplot(3,2,2)
plot(t,x2);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_2(t)');
title('Plot 2: A rectangular time-delayed pulse');

% A rectangular time-scaled pulse
x3 = rect(t/2);
subplot(3,2,3)
plot(t,x3);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_3(t)');
title('Plot 3: A rectangular time-scaled pulse');

% x4(t) addition of x1 and half of x2
x4 = x1 + 0.5 * x2;
subplot(3,2,4);
plot(t,x4);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_4(t)');
title('Plot 4: x4 = x1 + 0.5x2');

% x5(t) time reversal of x4(t)
x5 = rect(-t) + 0.5 * rect(-t-1);
subplot(3,2,5);
plot(t,x5);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_5(t)');
title('Plot 4: Time reversal of x5');

% x6(t) time delay of x5(t)
x6 = rect(1-t) + 0.5 * rect(-t);
subplot(3,2,6);
plot(t,x6);
axis([-2 2 -1 2])
xlabel('time (sec)');
ylabel('x_6(t)');
title('Plot 4: Time delay of x6');

