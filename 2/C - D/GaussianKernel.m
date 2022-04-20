function [ k ] = GaussianKernel(x,y,datax,datay,h ,stdev)
%KERNEL Summary of this function goes here
%   Detailed explanation goes here
    k = (1/(2*pi*stdev^2)) * exp(-0.5 * (([x y]-[datax datay]/h) * ([x y]-[datax datay]/h)')/stdev^2);
    
    %{
    if abs((x - datax)/h) < 0.5
        if abs((y - datay)/h) < 0.5
            k = 1;
        end
    end
        %}
    

end
