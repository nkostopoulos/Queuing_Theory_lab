clc;
clear all;
close all;

x = -5: 0.1: 5;
norm1 = normpdf(x, 0, 1);
norm2 = normpdf(x, 0, 2);

figure(1);
hold on;

plot(x, norm1, 'r', 'linewidth', 1.3)
plot(x, norm2, 'b', 'linewidth', 1.3)

hold off;
