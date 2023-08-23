function y = InformationSource(n)
    r = rand(1,n);
    a = r <= 0.5;
    b = (r > 0.5) & (r <= 0.75);
    c = (r > 0.75) & (r <= 0.875);
    d = (r > 0.8750) & (r <= 0.9375);
    e = (r > 0.9375) & (r <= 0.9688);
    f = (r > 0.9688) & (r <= 1);
    y = 'a'*a + 'b'*b + 'c'*c + 'd'*d + 'e'*e + 'f'*f;
    y = char(y);
end