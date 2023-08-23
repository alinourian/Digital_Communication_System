function showSignals(b,b1,b2,x1,x2,xc,...
            x_c,y1,y2,b1_hat,b2_hat,b_hat,Fs)
    figure;
tx = 0:1/Fs:0.01*length(b1)-1/Fs;
txc = 0:1/Fs:length(x1)/Fs-1/Fs;
subplot(4,2,[1 2]);stem(b,'linewidth',2);
    title('$b[n]$','Interpreter','latex'); xlim([0 length(b)]);
subplot(4,2,3); stem(b1,'linewidth',2);
    title('$b_1[n]$','Interpreter','latex'); xlim([0 length(b1)]);
subplot(4,2,4); plot(tx,x1,'linewidth',2);
    title('$x_1(t)$','Interpreter','latex'); %xlim([0 0.05]); %xlim([0 0.1]); %
    xlim([0 tx(end)]);
subplot(4,2,5); stem(b2,'linewidth',2);
    title('$b_2[n]$','Interpreter','latex'); xlim([0 length(b1)]);
subplot(4,2,6); plot(tx,x2,'linewidth',2);
    title('$x_2(t)$','Interpreter','latex'); %xlim([0 0.05]); %xlim([0 0.1]); %
    xlim([0 tx(end)]);
subplot(4,2,[7 8]); plot(txc,xc); 
    title('$x_c(t)$','Interpreter','latex'); xlim([0 txc(end)/16]);

figure;
subplot(4,2,[1 2]);plot(txc,x_c,'linewidth',2);
    title('$x_c(t)\quad(2)$','Interpreter','latex'); xlim([0 txc(end)/16]);
subplot(4,2,3); plot(tx,y1,'linewidth',2);
    title('$y_1(t)$','Interpreter','latex'); %xlim([0 0.05]); %xlim([0 0.1]); %
    xlim([0 tx(end)]);
subplot(4,2,4); stem(b1_hat,'linewidth',2);
    title('$\hat{b}_1[n]$','Interpreter','latex'); xlim([0 length(b1)]);
subplot(4,2,5); plot(tx,y2,'linewidth',2);
    title('$y_2(t)$','Interpreter','latex'); %xlim([0 0.05]); %xlim([0 0.1]); %
    xlim([0 tx(end)]);
subplot(4,2,6); stem(b2_hat,'linewidth',2);
    title('$\hat{b}_2[n]$','Interpreter','latex'); xlim([0 length(b1)]);
subplot(4,2,[7 8]); stem(b_hat,'linewidth',2); 
    title('$\hat{b}[n]$','Interpreter','latex'); xlim([0 length(b_hat)]);

end