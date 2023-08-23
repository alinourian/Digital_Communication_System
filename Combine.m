function b_hat = Combine(b1_hat, b2_hat)
    b_hat = zeros(1,length(b1_hat)*2);
    b_hat(1:2:end-1) = b1_hat;
    b_hat(2:2:end) = b2_hat;
end