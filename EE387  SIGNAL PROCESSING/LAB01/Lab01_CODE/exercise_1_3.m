x3 = [1, 2, 0, 2, 1];
h3 = [1, 2, 0, 2, 1];
y3 = conv(x3, h3);
t1 = linspace(-5,2,5);
t2 = linspace(-5,2,5);
t3 = linspace(-5,2,9);

subplot(2,2,1);
plot(t1,x3);
title('x(n) = [1,2,0,2,1]');

subplot(2,2,2);
plot(t2,h3);
title('h(n) = [1,2,0,2,1]');

subplot(2,2,3);
plot(t3,y3);
title('y(n) = x(n) * h(n)');