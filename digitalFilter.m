close all;
clear all;

%coeff for the design in digital domain
H0 = 0; %[dB]
H1 = -3; %[dB]
H2 = -40; %[dB]
f1_d = 7e3; %[Hz]
f2_d = 9e3; %[Hz]
fs = 48e3;%[Hz]
Ts = 1/fs;

%for ellip functions
Rp =  H0-H1;
Rs = -H2;

%--------------------------------------------------------------------------
%from digital to analog and then back to digital

%translate the design from digital to analog
f1 = fs/pi * tan(pi * f1_d/fs);
f2 = fs/pi * tan(pi * f2_d/fs);
wp = 2*pi*f1;
ws = 2*pi*f2;

%get the order needed to respect the design and the cut-off frequency
[n_a, Wp_a] = ellipord(wp, ws, Rp, Rs, 's'); % the 's' means analog, no need to normalized frequency 

%now get the zero and poles of the analog filter
[z_a,p_a,k_a] = ellip(n_a,Rp,Rs,Wp_a, 's');
filter_a_tf = zpk(z_a, p_a, k_a)
bode(filter_a_tf);

%bilinear transformation from analog filter
[zd_a, pd_a, kd_a] = bilinear(z_a, p_a, k_a, fs);
filter_ad_tf = zpk(zd_a, pd_a, kd_a, Ts)
hold on
bode(filter_ad_tf);

%--------------------------------------------------------------------------
%digital domain only
%get the order, frequencies must be normalized here with the nyquist
%frequency
[n_d, Wp_d] = ellipord(f1_d/(fs/2), f2/(fs/2), Rp, Rs);

%get the poles and zeros
[z_d, p_d, k_d] = ellip(n_d, Rp, Rs, Wp_d);
filter_dd_tf = zpk(z_d, p_d, k_d ,Ts)
hold on
bode(filter_dd_tf);
legend('analog filter','digital 1 filter', 'digital 2 filter')

%--------------------------------------------------------------------------
%get the 2 2nd order tf : from zpk to sos
sos = zp2sos(z_d, p_d, k_d)
[mag, freq] = freqz(sos, 100);
figure
plot(freq/pi,20*log10(abs(mag)))
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

%now extract the coeff for the first stage
b0_1 = sos(1,1)
b1_1 = sos(1,2)
b2_1 = sos(1,3)
a0_1 = sos(1,4)
a1_1 = sos(1,5)
a2_1 = sos(1,6)

%now extract the coeff for the first stage
b0_2 = sos(2,1)
b1_2 = sos(2,2)
b2_2 = sos(2,3)
a0_2 = sos(2,4)
a1_2 = sos(2,5)
a2_2 = sos(2,6)



