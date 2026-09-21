w = pi/10;
range = 1:40;
func = exp(range.*i*w);

tiledlayout(3,1);

figure(1);
nexttile;
plot(func);
title("3a) complex and real elements of the function");

figure(2)
subplot(2,1,1);
stem(real(func));
title("3b) real component")

subplot(2,1,2);
stem(imag(func));
title("3b) imaginary component")

figure(3)
subplot(2,1,1);
stem(angle(func));
title("3c) phase");

subplot(2,1,2);
stem(norm(func));
title("3c) magnitude");


