function [ class ] = BClassifier( x , y , py1 , py2 )
%BCLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
    class = 1;
    if py2(x,y) > py1(x,y)
        class = 2;
    end

end

