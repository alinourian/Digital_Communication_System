clear; clc; close all;
x = InformationSource(50);
y = SourceEncoder(x);
xd = SourceDecoder(y);

disp(['x    =    ', x]);
disp(['xd   =    ', xd]);
%% Calculate Hn(X) = L(X)/n
H = zeros(1,5000);
for n=1:5000
    x = InformationSource(n);
    y = SourceEncoder(x);
    N = length(y);
    H(n) = N/n;
end
%% Plot Hn(X)
figure; plot(H,'x'); grid on;
title('$H_n(X)=\frac{L_B(n)}{n}$','Interpreter','latex');
ylabel('$H_n(X)$ (Average Length of Code)','Interpreter','latex');
xlabel('$n$ (Number of Symbols)','Interpreter','latex');
