%% ============================= Main Code ================================
clear; clc; close all;

b = randi(2,1,100)-1;

Fs = 10^6;
fc = 10*10^3;
Fm = 10*10^3;
BW = 3*10^3;
T = 0.01;

t = 0:1/Fs:T-1/Fs;
p1 = sin(2*pi*1000*t);
p0 = sin(2*pi*1500*t);

[~,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,inf,11);
%% Find Error for Spesific Noise Variance
clc; close all;
var_noise = -inf;
snr = 10*log(sum(b.^2)/10^(var_noise/10))/log(10);

[b_hat,matchedFilt0,matchedFilt1] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr,11);
err = sum(abs(b_hat - b));
%% Calculate Error Probability - Do not run again, the result has been saved.
clc; close all;

Px = sum(b.^2);
Error_FSK = zeros(1,10);
for varn = 85:5:90
    snr = Px/10^(varn/10);
    snr = 10*log(snr)/log(10);
    err = 0;
    disp(varn);
    for i=1:50
        disp([num2str(varn),':',num2str(i)])
        [b_hat,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr,0);
        err = err + sum(abs(b_hat - b))*0.04;
    end
    Error_FSK(varn/5-7) = err;
end
%%
save('Error_FSK','Error_FSK');
%% Plot Error Probability vs Noise Variance
load 'Error_FSK';
plot(40:5:100,Error_FSK,'linewidth',2);
xlabel('Noise Variance (dB)','Interpreter','latex');
ylabel('Bit Error (\%)','Interpreter','latex'); grid on;

%%
noise_var = [0 10 20 30 40 50];
snr = 10*log(sum(b.^2)./10.^(noise_var/10))/log(10);

[~,m01,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(1),0);
[~,m02,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(2),0);
[~,m03,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(3),0);
[~,m04,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(4),0);
[~,m05,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(5),0);
[~,m06,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(6),0);
%%
figure;
subplot(121); drawSignalConstellation(m01,noise_var(1),snr(1),0);
subplot(122); drawSignalConstellation(m02,noise_var(2),snr(2),0);
figure;
subplot(121); drawSignalConstellation(m03,noise_var(3),snr(3),0);
subplot(122); drawSignalConstellation(m04,noise_var(4),snr(4),0);
figure;
subplot(121); drawSignalConstellation(m05,noise_var(5),snr(5),0);
subplot(122); drawSignalConstellation(m06,noise_var(6),snr(6),0);

