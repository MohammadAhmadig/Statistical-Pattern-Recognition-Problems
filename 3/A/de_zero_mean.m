function [ nx ] = de_zero_mean (x, mu)
    [m,n] = size(x);
    nx = zeros(m,n);    
    for i = 1:m
        nx(i,:) = x(i,:) + mu;
    end
end

