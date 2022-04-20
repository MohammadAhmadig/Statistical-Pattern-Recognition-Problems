function [ k ] = Kernel(x,y,datax,datay,h )
%KERNEL Summary of this function goes here
%   Detailed explanation goes here
    k = 0;
    if abs((x - datax)/h) < 0.5
        if abs((y - datay)/h) < 0.5
            k = 1;
        end
    end
        
    

end

