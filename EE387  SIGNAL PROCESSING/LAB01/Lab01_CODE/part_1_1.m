% Main function for ploting the graph
clear all;

Ts = 0.01; t = -5:Ts:5;
t = -5:0.01:5;

y1 = ramp(t, 3, 3);
y2 = ramp(t, -6, 1);
y3 = ramp(t, 3, 0);
y4 = ustep(t, -3);
y = y1 - 2 * y2 + 3 * y3 -y4;
plot(t, y, 'k'); axis([-5 5 -1 7]); grid
