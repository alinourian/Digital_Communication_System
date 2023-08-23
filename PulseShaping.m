function y = PulseShaping(x,p0,p1)
    l = length(p0);
    y = zeros(1,length(x)*l);
    for i=1:length(x)
        if x(i) == 1
            y((i-1)*l+1:i*l) = p1;
        else
            y((i-1)*l+1:i*l) = p0;
        end
    end
end