x2 = [1, 2, 3, 4, 5];
h2 = 1;
y2 = conv(x2, h2);
t1 = linspace(-5,5,5);
t2 = linspace(-5,5,1);
t3 = linspace(-5,5,5);

subplot(2,2,1);
plot(t1,x2);
title('x(n) = [1,2,3,4,5]');

subplot(2,2,2);
plot(t2,h2);
title('h(n) = [1]');

subplot(2,2,3);
plot(t3,y2);
title('y(n) = x(n) * h(n)');