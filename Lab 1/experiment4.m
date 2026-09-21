clear all
[y,fs] = audioread('defineit.wav');
tiledlayout(3,2)

nexttile
plot(y)
nexttile
histogram(y,50)

delta = 2/8;
Q_Matrix = linspace(-1+delta/2, 1-delta/2, 8);

function output_data = qnt(input_data, matrix)
    output_data = interp1(matrix,matrix,input_data,'nearest');
end

y_scale_factor = 1/max(y); %based on histogram it appears gaussian and centered so only scaling done, no shifts
y_scaled = y.*y_scale_factor;
y3bit = qnt(y_scaled, Q_Matrix);

nexttile
plot(y3bit)

nexttile
histogram(y3bit, 50);

audiowrite("defineit_3bit.wav", y3bit, fs)

y_scale_factor_clip = y_scale_factor * 10; %random guess figure
y_pclip = y.*y_scale_factor_clip;
y3bit_pclip = qnt(y_pclip, Q_Matrix);

nexttile
plot(y3bit_pclip)

nexttile
histogram(y3bit_pclip, 50);

audiowrite("defineit_3bit_pclip.wav", y3bit_pclip, fs)