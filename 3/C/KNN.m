function [ label ] = KNN( train_matrix,test_vector )
    min_distance = Inf;
    
    for i=1:size(train_matrix,1)
        distance = 0;
        for j=1:length(test_vector)
            distance = distance + (test_vector(j) - train_matrix(i,j))^2;
        end
        if distance < min_distance
            min_distance = distance;
            index = i;
        end
    end
    
    label = ceil(index/21);    
end

