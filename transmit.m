function [b_hat,matchedFilt0,matchedFilt1] = ...
    transmit(b,p1,p0,Fs,fc,Fm,BW,snr,draw)

varn = 10*log(sum(b.^2)/10^(snr/10));

[b1,b2] = Divide(b);
x1 = PulseShaping(b1,p0,p1);
x2 = PulseShaping(b2,p0,p1);
xc = AnalogMod(x1,x2,Fs,fc);

x_c = Channel(xc,Fs,Fm,BW);
x_c = awgn(x_c,snr);
[y1,y2] = AnalogDemod(x_c,Fs,fc,BW);

[b1_hat,b1_matchedFilt0,b1_matchedFilt1] = MatchedFilt(y1,p0,p1);
[b2_hat,b2_matchedFilt0,b2_matchedFilt1] = MatchedFilt(y2,p0,p1);
b_hat = Combine(b1_hat,b2_hat);
matchedFilt0 = Combine(b1_matchedFilt0,b2_matchedFilt0);
matchedFilt1 = Combine(b1_matchedFilt1,b2_matchedFilt1);

if draw == 10
    showSignals(b,b1,b2,x1,x2,xc,...
            x_c,y1,y2,b1_hat,b2_hat,b_hat,Fs);
elseif draw == 01
    drawSignalConstellation(matchedFilt0,varn,snr);
elseif draw == 11
    showSignals(b,b1,b2,x1,x2,xc,...
            x_c,y1,y2,b1_hat,b2_hat,b_hat,Fs);
    drawSignalConstellation(matchedFilt0,varn,snr);
end

end