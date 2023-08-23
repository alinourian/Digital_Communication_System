function x_c = Channel(xc, Fs, Fm, BW)
    x_c = bandpass(xc,[Fm-BW/2, Fm+BW/2],Fs);
end