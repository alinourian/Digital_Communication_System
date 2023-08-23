function [b,matchedFilt0,matchedFilt1] = MatchedFilt(y,p0,p1)
    l = length(p0);
    n = length(y)/l;
    y0 = reshape(y,l,n)';
    yc0 = convn(y0,flip(p0))/length(p0);
    yc1 = convn(y0,flip(p1))/length(p1);
    matchedFilt0 = yc0(:,length(p0));
    matchedFilt1 = yc1(:,length(p1));
    b = matchedFilt1 > matchedFilt0;
end