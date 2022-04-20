function [ datanew ] = Addfeature( data )
%ADDFEATURE Summary of this function goes here
%   Detailed explanation goes here
    datanew = [ data ; zeros(size(data,2),1)'];
    for i = 1 : size(data,2)
        numof1s=0;
        numof2s=0;
        for k = 1 : 784
            if data(k,i)==1
                numof1s = numof1s +1;
            elseif data(k,i)==2
                numof2s = numof2s +1;
            end
        end
        datanew(785,i) = round((numof2s+numof1s)/10)*10;
        
    end

end

