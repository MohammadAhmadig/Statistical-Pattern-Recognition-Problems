function [ result ] = find_accuracy( dataTest ,SVMModel1,SVMModel2,SVMModel3,SVMModel4)
labelResult = ones(size(dataTest,1),4);

[label,~] = predict(SVMModel1,dataTest(:,1:18));
labelResult(:,1) = label;

[label,~] = predict(SVMModel2,dataTest(:,1:18));
labelResult(:,2) = label;

[label,~] = predict(SVMModel3,dataTest(:,1:18));
labelResult(:,3) = label;

[label,~] = predict(SVMModel4,dataTest(:,1:18));
labelResult(:,4) = label;

n = size(dataTest,1);
nCorrect = 0;

for i = 1:n
    if(labelResult(i,1) == 1)
        if(dataTest(i,19) == 1)
            nCorrect = nCorrect + 1;
        end
    elseif(labelResult(i,2) == 2)
        if(dataTest(i,19) == 2)
            nCorrect = nCorrect + 1;
        end
    elseif(labelResult(i,3) == 3)
        if(dataTest(i,19) == 3)
            nCorrect = nCorrect + 1;
        end
    elseif(labelResult(i,4) == 4)
        if(dataTest(i,19) == 4)
            nCorrect = nCorrect + 1;
        end
    end
end

result = (nCorrect/n)*100;
end

