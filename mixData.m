function [y] = mixData(x,qt)

    r = randperm(qt);
    for i=1:1:qt  
        y(i,:) = x(r(i),:);     
    end

end
    