
x1 = [1, 2, 4];
h1 = [1, 1, 1, 1, 1];
y1 = conv(x1, h1);
t1 = linspace(-5,5,3);
t2 = linspace(-5,5,5);
t3 = linspace(-5,5,7);

subplot(2,2,1);
plot(t1,x1);
title('x(n) = [1,2,4]');

subplot(2,2,2);
plot(t2,h1);
title('h(n) = [1,1,1,1,1]');

subplot(2,2,3);
plot(t3,y1);
title('y(n) = x(n) * h(n)');