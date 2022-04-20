function [ nx,mu ] = zero_mean ( x )
    [m,n] = size(x);    
    mu = sum(x)/m;
    nx = zeros(m,n);
    for i = 1:m
        nx(i,:) = x(i,:) - mu;
    end
end

