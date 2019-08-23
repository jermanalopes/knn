function dist = cosineDistance(x,y)
denom = double (sqrt(sum(x.^2)*sum(y.^2)));
dist = double (1-(x*y')/denom);
end