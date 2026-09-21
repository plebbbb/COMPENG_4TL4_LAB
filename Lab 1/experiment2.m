clear all
tiledlayout(3,1)

data = zeros([30,1]);
data(16) = data(16) + 1;
data(12:end) = data(12:end) + 1;

nexttile
stem(data)
title("2a) Unit impulse and unit step")

data2 = zeros([30,1]);
data2(14:end) = data2(14:end) + 1;
data2(15:end) = data2(15:end) - 1;

nexttile
stem(data2)
title("2b) Step at 14 - step at 15")

data3 = zeros([30,1]);
data3(9:end) = data3(9:end) + 1;
data3(16:end) = data3(16:end) - 1;

nexttile
stem(data3)
title("2c) Step at 9 - step at 16")