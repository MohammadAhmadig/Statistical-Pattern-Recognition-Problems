function [ result ] = find_accuracy( y,label )
    n = size(y,1);
    nCorrect = 0;
    for i = 1:size(y,1)
        if( y(i) == label(i) )
            nCorrect = nCorrect + 1;
        end
    end

    result = (nCorrect/n)*100;
end

