clear all;
clc;

% numerator
n0 = 0;
n1 = 0;
n2 = 1;
Num = [n0, n1, n2];

%cut-off frequency
fc = 1e3;
wc = 2*pi*fc;

%denominator
d0 = 1/(wc*wc);
d1 = 1.414/wc;
d2 = 1;
Den = [d0, d1, d2];

%continuous tf
filter_a_tf = tf(Num, Den) 

%sampling frequency
fs = 10*fc;
ws = 2*pi*fs;
Ts = 1 / fs

%from Num, Den to z, p, k analog
[za, pa, ka] = tf2zpk(Num, Den)

%---------------------------------------------------------------------------------------
%from z, p, k analog to z, p, k with exact transformation
zd1=[];
pd1 = exp(pa*Ts)
kd1 = ka * prod((1-pd1)./(pa))

%from z, p, k to discrete tf
filter_d1_tf = zpk(zd1, pd1, kd1, Ts)

%---------------------------------------------------------------------------------------
%from z, p, k continuous to z, p, k with bilinear approximation
pd2 = [(1+pa(1)*Ts/2)/(1-pa(1)*Ts/2); (1+pa(2)*Ts/2)/(1-pa(2)*Ts/2)]
zd2 = [-1; -1]
kd2 = 1;
denTemp = 1;
for i=1:length(pa)
    denTemp = denTemp * (2/Ts-pa(i));
end
kd2 = ka/denTemp

%from z, p, k to discrete tf
filter_d2_tf = zpk(zd2, pd2, kd2, Ts)

%---------------------------------------------------------------------------------------
%plot zero and pole with exact transformation

zplane(zd1, pd1)
grid
title('Z-plane with exact transformation')

%plot zero and pole with bilinear approximation 
figure
zplane(zd2, pd2)
grid
title('Z-plane with bilinear approximation')

%plot the bode diagram of the exact transformation
figure('units','normalized','outerposition',[0 0 1 1])
bode(filter_d1_tf)

%plot the bode diagram of the bilinear approximation
hold on
bode(filter_d2_tf)

%plot the continuous transfert function
hold on
bode(filter_a_tf)
legend('Bode with exact transformation', 'Bode with bilinear approximation', 'Bode of the continuous tf')

%------------------------------------------------------------------------------------------------------------
%test the tfs with various stimulis
%step
figure
subplot(1,3,1)
step(filter_a_tf)
xlabel('time')
ylabel('output')
legend('analog tf')
subplot(1,3,2)
step(filter_d1_tf)
xlabel('time')
ylabel('output')
legend('exact transformation tf')
subplot(1,3,3)
step(filter_d2_tf)
xlabel('time')
ylabel('output')
legend('bilinear approximation tf')


%sin 100Hz
N=0.02
t = 0:Ts:N;
wt1 = 100 * 2 * pi; %rad/sec
wt2 = 2e3 * 2 * pi; %rad/sec
sig_sin_ft1 = sin(wt1 * t)
sig_sin_ft2 = sin(wt2 * t)

%simulate the digital tf constructed with the bilinear approximation
figure
lsim(filter_d2_tf, sig_sin_ft2, t)
title('digital tf (bilinear approx.) : sinus at 2kHz');

figure 
lsim(filter_d2_tf, sig_sin_ft1, t)
title('digital tf (bilinear approx.) : sinus at 100Hz');

%simulate the digital tf constructed with the exact transformation
figure
lsim(filter_d1_tf, sig_sin_ft2, t)
title('digital tf (exact trans.) : sinus at 2kHz');

figure 
lsim(filter_d1_tf, sig_sin_ft1, t)
title('digital tf (exact trans.) : sinus at 100Hz');

%simulate the analog tf
figure
lsim(filter_a_tf, sig_sin_ft2, t)
title('digital tf (exact trans.) : sinus at 2kHz');

figure 
lsim(filter_a_tf, sig_sin_ft1, t)
title('digital tf (exact trans.) : sinus at 100Hz');
