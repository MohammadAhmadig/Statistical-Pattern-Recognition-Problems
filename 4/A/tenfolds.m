function [ M ] = tenfolds( data )
    n = size(data,1);
    M = 1:n;
    shuffleTimes = 2*n;
    randomNumbers = randi(n,shuffleTimes,2);
    for i = 1 : shuffleTimes
        temp = M(randomNumbers(i,1));
        M(randomNumbers(i,1)) = M(randomNumbers(i,2));
        M(randomNumbers(i,2)) = temp;
    end
    m = n/10;
    M = reshape(M,m,10);
end

