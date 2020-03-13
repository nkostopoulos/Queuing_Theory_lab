interval = -pi: 0.0001: pi;

hmit = sin(interval);
syn = cos(interval);
hmit_x2 = sin(2 * interval);
syn_x2 = cos(2 * interval);

subplot(2, 2, 1);
plot(interval, hmit, "linewidth", 2.5, "b");
title("f(x) = sin(x)", "fontsize", 20);

subplot(2, 2, 2);
plot(interval, syn, "linewidth", 2.5, "r");
title("f(x) = cos(x)", "fontsize", 20);

subplot(2, 2, 3);
plot(interval, hmit_x2, "linewidth", 2.5, "g");
title("f(x) = sin(2x)", "fontsize", 20);

subplot(2, 2, 4);
plot(interval, syn_x2, "linewidth", 2.5, "m");
title("f(x) = cos(2x)", "fontsize", 20);
