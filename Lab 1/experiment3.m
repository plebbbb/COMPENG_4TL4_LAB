w = pi/10;
range = 1:40;
func = exp(range.*1i*w);

tiledlayout(3,1);

figure(1);
nexttile;
plot(func);
title("3a) complex and real elements of the x[n]");
xlabel("Real Axis")
ylabel("Complex Axis")

figure(2)
subplot(2,1,1);
stem(range,real(func));
title("3b) x[n] real component")
xlabel("sample num")
ylabel("real value")

subplot(2,1,2);
stem(range,imag(func));
title("3b) x[n] imaginary component")
xlabel("sample num")
ylabel("imaginary value")

figure(3)
subplot(2,1,1);
stem(range,angle(func));
title("3c) x[n] phase");
xlabel("sample num")
ylabel("phase (rads)")

subplot(2,1,2);
stem(range,abs(func));
title("3c) x[n] magnitude");
xlabel("sample num")
ylabel("magnitude")


