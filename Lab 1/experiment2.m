clear all
tiledlayout(4,1)

unit_step = @(offset, data) (data >= offset);
unit_impulse = @(offset, data) (data == offset);

dataY1 = [1:30];

nexttile
stem(dataY1, unit_impulse(16, dataY1));
title("2a) unit impulse S(n-16)");
xlabel("samples")
ylabel("output")

nexttile
stem(dataY1, unit_step(12, dataY1));
title("2a) unit step u(n-12)");
xlabel("samples")
ylabel("output")

nexttile
stem(dataY1, unit_step(14, dataY1) - unit_step(15, dataY1));
title("2b) x1[n] = u(n-14) - u(n-15)");
xlabel("samples")
ylabel("output")

nexttile
stem(dataY1, unit_step(9, dataY1) - unit_step(16,dataY1));
title("2c) x2[n] = u(n-9) - u(n-16)");
xlabel("samples")
ylabel("output")
