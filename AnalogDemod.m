function [y1,y2] = AnalogDemod(y,Fs,fc,BW)
    Ts = 1/Fs;
    L = length(y)/Fs;
    t = 0:Ts:L-Ts;
    y_1 = y.*cos(2*pi*fc*t);
    y_2 = y.*sin(2*pi*fc*t);
    
    Y_1 = fftshift(fft(y_1));
    L = length(Y_1);
    f = Fs*(floor(-L/2):floor(L/2)-1)/L;
    Y1 = Y_1 .* ((f < BW) & (f > -BW));
    y1 = 2*ifft(ifftshift(Y1));
    
    Y_2 = fftshift(fft(y_2));
    L = length(Y_2);
    f = Fs*(floor(-L/2):floor(L/2)-1)/L;
    Y2 = Y_2 .* ((f < BW) & (f > -BW));
    y2 = 2*ifft(ifftshift(Y2));
end