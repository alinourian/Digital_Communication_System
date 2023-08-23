function y = OutputDecoder(x)
    n = length(x)/8;
    y = reshape(x,8,n)';
	y = bi2de(y,'left-msb')';
end