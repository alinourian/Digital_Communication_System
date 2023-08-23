function y = SourceGenerator(x)
	y = de2bi(x,8,'left-msb')';
	y = y(:)';
end