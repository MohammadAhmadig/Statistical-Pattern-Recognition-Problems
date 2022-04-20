function [ v ] = VKNN( x,y,datax,datay,k )
%VKNN Summary of this function goes here
%   Detailed explanation goes here
    d = zeros(size(datax,1),1);
    for i = 1 : size(datax,1)
        d(i) = sqrt((x-datax(i))^2 + (y-datay(i))^2 ) ;
    end
    for i = 1 : k
       [mind,minind] = min(d);
       d(minind) = [];
        
    end
    r = mind;
    v = pi * r^2;
    
end

