function drawSignalConstellation(matchedFilt0,varn,snr,fig)
    if nargin < 2
        varn = 'Unknown';
        snr = 'Unkown';
        fig = 1;
    elseif nargin < 4
        varn = num2str(varn);
        snr = num2str(snr);
        fig = 1;
    else
        varn = num2str(varn);
        snr = num2str(snr);
    end
    if fig == 1
        figure;
    end
    [b1_matchedFilt0,b2_matchedFilt0] = Divide(matchedFilt0);
    scatter(b1_matchedFilt0,b2_matchedFilt0,'filled'); grid on;
    title(['Signal Constellation (noise variance$=',...
        varn,',$ SNR$=',snr,'$)'],'Interpreter','latex');
    xlabel('$\hat{b}_1[n]$','Interpreter','latex');
    ylabel('$\hat{b}_2[n]$','Interpreter','latex');
%     axis([-1.5 1.5 -1.5 1.5]);
end