function xc = AnalogMod(x1, x2, Fs, fc)
    Ts = 1/Fs;
    L = length(x1)/Fs;
    t = 0:Ts:L-Ts;
    xc = x1.*cos(2*pi*fc*t) + x2.*sin(2*pi*fc*t);
end