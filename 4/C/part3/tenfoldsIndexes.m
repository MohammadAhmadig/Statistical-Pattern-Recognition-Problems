function [ trainIndex,testIndex ] = tenfoldsIndexes( m,j )
    testIndex = m(:,j);
    trainIndex1 = m(:,1:(j-1));
    trainIndex2 = m(:,(j+1):end);
    trainIndex = [trainIndex1 trainIndex2];
    trainIndex = reshape(trainIndex,9*size(testIndex,1),1);
end

