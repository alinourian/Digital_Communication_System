clear; clc; close all;

x = randi(256,1,20)-1;
b = SourceGenerator(x);

Fs = 10^6;
fc = 10*10^3;
Fm = 10*10^3;
BW = 10^3;
T = 0.01;

t = 0:1/Fs:T-1/Fs;
p1 = ones(1,length(t));
p0 = -p1;

[b_hat,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,inf,11);
x_hat = OutputDecoder(b_hat);
%%
clc; close all;
Px = sum(b.^2);
% var_err = zeros(1,10);
for varn = 40:5:100
    snr = Px/10^(varn/10);
    snr = 10*log(snr)/log(10);
    disp(varn);
    err = zeros(1,25);
    for i=1:25
        [b_hat,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr,0);
        err(i) = sum(abs(b_hat - b));
    end
    var_err(varn/5-7) = var(err);
end

%%
save('Var_Error','var_err');
%%
load 'Var_Error'

plot(40:5:100,var_err,'linewidth',2);
xlabel('Noise Variance (dB)','Interpreter','latex');
ylabel('Error Variance','Interpreter','latex'); grid on;
%%
noise_var = [60 100 140 180 200 250];
snr = 10*log(sum(b.^2)./10.^(noise_var/10))/log(10);

[b_hat1,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(1),0);
[b_hat2,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(2),0);
[b_hat3,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(3),0);
[b_hat4,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(4),0);
[b_hat5,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(5),0);
[b_hat6,~,~] = transmit(b,p1,p0,Fs,fc,Fm,BW,snr(6),0);
%%
index1 = b_hat1 ~= b;
index2 = b_hat2 ~= b;
index3 = b_hat3 ~= b;
index4 = b_hat4 ~= b;
index5 = b_hat5 ~= b;
index6 = b_hat6 ~= b;

a = ones(1,10);
figure;
subplot(231); histogram(conv(index1,a));
subplot(232); histogram(conv(index2,a));
subplot(233); histogram(conv(index3,a));
subplot(234); histogram(conv(index4,a));
subplot(235); histogram(conv(index5,a));
subplot(236); histogram(conv(index6,a));