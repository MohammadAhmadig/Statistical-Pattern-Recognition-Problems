function [ Data ] = ReadData( filename )
    
    fileID = fopen(filename , 'r');
    rawData = fscanf(fileID,'%c');
    DataLength = length(rawData) * 28 /29;
    Data = zeros(DataLength,1);
    j=1;
    for i=1:length(rawData)
        if rawData(i) == ' '
            Data(j) = 0;
            j = j+1;
        elseif rawData(i) == '+'
            Data(j) = 1;
            j = j+1;
        elseif rawData(i) == '#'
            Data(j) = 2;
            j = j+1;
        end
    end
    
    Data = reshape(Data,28*28,DataLength/(28*28));

end

