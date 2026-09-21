clear all
tiledlayout(6,1)

sinusoid = @(t, a, f, psi) (a*cos(t.*2*pi*f + psi));

st = 0;
ed = 0.5;
spl = 100;

step1a_row = @(a, f, psi) (sinusoid(linspace(st, ed, spl), a, f, psi));

function L = disp_stem(A, F, PSI, func)
nexttile
stem(func(A, F, PSI));
title("A = " + A, " Freq = " + F + "hz Phase = " + PSI);
end

disp_stem(5,10,0,step1a_row);
disp_stem(5,25,0,step1a_row);
disp_stem(5,40,0,step1a_row);
disp_stem(5,60,0,step1a_row);
disp_stem(5,40,pi/2,step1a_row);
disp_stem(5,60,pi/2,step1a_row);