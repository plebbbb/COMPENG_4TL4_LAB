clear all

sinusoid = @(t, a, f, psi) (a*cos(t.*2*pi*f + psi));

st = 0;
ed = 0.5;
spl = 51;
splR = 400;

step1a_Y = @(a, f, psi) (sinusoid(linspace(st, ed, spl), a, f, psi));
step1b_Y_ref = @(a, f, psi) (sinusoid(linspace(st, ed, splR), a, f, psi));

step1a_X = linspace(st, ed, spl);
step1b_X_ref = linspace(st, ed, splR);

function L = disp_stem(A, F, PSI, funcY, funcX)
nexttile
stem(funcX,funcY(A, F, PSI));
title("A = " + A + " Freq = " + F + "hz Phase = " + PSI);
xlabel("time, s")
ylabel("x[n]")
end

function L2 = disp_stem_ref(A, F, PSI, funcY, funcX, funcYR, funcXR)
nexttile
hold on
stem(funcX,funcY(A, F, PSI));
plot(funcXR,funcYR(A, F, PSI));
title("A = " + A + " Freq = " + F + "hz Phase = " + PSI);
xlabel("time, s")
ylabel("x[n]")
hold off
end

figure(1)
tiledlayout(3,2)

disp_stem(5,10,0,step1a_Y,step1a_X);
disp_stem(5,25,0,step1a_Y,step1a_X);
disp_stem(5,40,0,step1a_Y,step1a_X);
disp_stem(5,60,0,step1a_Y,step1a_X);
disp_stem(5,40,pi/2,step1a_Y,step1a_X);
disp_stem(5,60,pi/2,step1a_Y,step1a_X);

figure(2)
tiledlayout(3,2)

disp_stem_ref(5,10,0,step1a_Y,step1a_X,step1b_Y_ref,step1b_X_ref);
disp_stem_ref(5,25,0,step1a_Y,step1a_X,step1b_Y_ref,step1b_X_ref);
disp_stem_ref(5,40,0,step1a_Y,step1a_X,step1b_Y_ref,step1b_X_ref);
disp_stem_ref(5,60,0,step1a_Y,step1a_X,step1b_Y_ref,step1b_X_ref);
disp_stem_ref(5,40,pi/2,step1a_Y,step1a_X,step1b_Y_ref,step1b_X_ref);
disp_stem_ref(5,60,pi/2,step1a_Y,step1a_X,step1b_Y_ref,step1b_X_ref);