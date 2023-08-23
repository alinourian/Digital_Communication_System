function y = SourceDecoder(x)
    n = length(x);
    i=1;
    y = [];
    while i <= n
        if x(i) == 0
            y = cat(2,y,'a'); i=i+1;
        elseif x(i+1) == 0
            y = cat(2,y,'b'); i=i+2;
        elseif x(i+2) == 0
            y = cat(2,y,'c'); i=i+3;
        elseif x(i+3) == 0
            y = cat(2,y,'d'); i=i+4;
        elseif x(i+4) == 0
            y = cat(2,y,'e'); i=i+5;
        else
            y = cat(2,y,'f'); i=i+5;
        end
    end
end