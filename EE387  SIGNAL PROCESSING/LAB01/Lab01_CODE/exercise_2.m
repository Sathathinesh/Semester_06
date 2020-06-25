t1 = linspace(0,5,5);
h1 = h(t1)
y1 = [1, 2, 2.5, 3, 3, 3, 2, 1, 0];
x1 = deconv(y1, h1);

t2 = linspace(0,5,9);
t3 = linspace(0,5,5);

subplot(2,2,1);
plot(t1,h1);
title('h(n) = [1.0000,0.4204,0.1768,0.0743,0.0000]');

subplot(2,2,2);
plot(t2,y1);
title('y(n) = [1,2,2.5,3,3,3,2,1,0]');

subplot(2,2,3);
plot(t3,x1);
title('x(n) is deconvolution of y1,h1');

