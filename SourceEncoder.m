function y = SourceEncoder(x)
    n = length(x);
    l = sum(x=='a')+sum(x=='b')*2+sum(x=='c')*3+sum(x=='d')*4+...
        sum(x=='e')*5+sum(x=='f')*5;
    y = zeros(1,l);
    k = 1;
    for i=1:n
        if x(i) == 'a'
            y(k) = 0; k = k + 1;
        elseif x(i) == 'b'
            y(k:k+1) = [1 0]; k = k + 2;
        elseif x(i) == 'c'
            y(k:k+2) = [1 1 0]; k = k + 3;           
        elseif x(i) == 'd'
            y(k:k+3) = [1 1 1 0]; k = k + 4;                 
        elseif x(i) == 'e'
            y(k:k+4) = [1 1 1 1 0]; k = k + 5;
        elseif x(i) == 'f'
            y(k:k+4) = [1 1 1 1 1]; k = k + 5;
        end
    end
end