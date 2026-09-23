clear all
[y,fs] = audioread('defineit.wav');
tiledlayout(5,2)

nexttile
plot(y)
title("4b) input waveform, 16khz, quantization: 16 bit")
xlabel("sample")
ylabel("amplitude")

nexttile
histogram(y,50)
title("4b) input historgram")
xlabel("amplitude")
ylabel("occurances")


delta = 2/8;
Q_Matrix = linspace(-1+delta/2, 1-delta/2, 8);

%3 bit quantizer based on interp1 function
function output_data = qnt(input_data, matrix)
    output_data = interp1(matrix,matrix,input_data,'nearest','extrap');
end

y_scale_factor = 1/max(y); %based on histogram it appears gaussian and centered so only scaling done, no shifts
y_scaled = y.*y_scale_factor;
y3bit = qnt(y_scaled, Q_Matrix);

nexttile
plot(y3bit)
title("4f) 3 bit quantitized waveform (scale: " + y_scale_factor + ")")
xlabel("sample")
ylabel("amplitude")

nexttile
histogram(y3bit, 50);
title("4f) 3 bit quantitized histogram (scale: " + y_scale_factor + ")")
xlabel("amplitude")
ylabel("occurances")

audiowrite("defineit_3bit.wav", y3bit, fs)

nexttile()
plot(y_scaled-y3bit)
title("4f) quantization error waveform")
xlabel("sample")
ylabel("amplitude")

nexttile()
histogram(y_scaled-y3bit,50)
title("4f) quantization error histogram")
xlabel("amplitude")
ylabel("occurances")

y_scale_factor_clip = 1/median(abs(y)); %ensures 50% of samples are clipped
y_pclip = y.*y_scale_factor_clip;
y3bit_pclip = qnt(y_pclip, Q_Matrix);

nexttile
plot(y3bit_pclip)
title("4g) 3 bit quantitized waveform, clipped (50% clipped) (scale: " + y_scale_factor_clip + ")")
xlabel("sample")
ylabel("amplitude")

nexttile
histogram(y3bit_pclip, 50);
title("4g) 3 bit quantitized histogram clipped (50% clipped) (scale: " + y_scale_factor_clip + ")")
xlabel("amplitude")
ylabel("occurances")

audiowrite("defineit_3bit_pclip.wav", y3bit_pclip, fs)

nexttile()
plot(y_pclip-y3bit_pclip)
title("4g) clipped quantization error waveform")
xlabel("sample")
ylabel("amplitude")

nexttile()
histogram(y_pclip-y3bit_pclip,50)
title("4g) clipped quantization error histogram")
xlabel("amplitude")
ylabel("occurances")
