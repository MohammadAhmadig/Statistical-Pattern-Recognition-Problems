load('myxaa.dat');

data = myxaa;

parameters = [0.01 0.04 0.1 0.4 1 4 10 40];

resultMeanTest = ones(8,8);
resultVarianceTest = ones(8,8);

resultMeanTrain = ones(8,8);
resultVarianceTrain = ones(8,8);

for CI = 1:8
    for SigmaI = 1:8
        c = parameters(CI);
        sigma = parameters(SigmaI);
        
        accuraciesTest = ones(1,100);
        accuraciesTrain = ones(1,100);
        % ten times ten folds
        for i = 1:10
            m = tenfolds(data);
            
            for j = 1:10
                [trainIndex,testIndex] = tenfoldsIndexes(m,j);
                dataTrain = data(trainIndex,:);
                dataTest = data(testIndex,:);
                
                % class 1
                SVMModel1 = MultiSVM(dataTrain,1,c,sigma);
                
                % class 2
                SVMModel2 = MultiSVM(dataTrain,2,c,sigma);
                
                % class 3
                SVMModel3 = MultiSVM(dataTrain,3,c,sigma);
                
                % class 4
                SVMModel4 = MultiSVM(dataTrain,4,c,sigma);                                
                
                accuraciesTest((i-1)*10+j) = find_accuracy(dataTest,SVMModel1,SVMModel2,SVMModel3,SVMModel4);
                accuraciesTrain((i-1)*10+j) = find_accuracy(dataTrain,SVMModel1,SVMModel2,SVMModel3,SVMModel4);
            end            
        end
        
        resultMeanTest(CI,SigmaI) = mean(accuraciesTest);
        resultVarianceTest(CI,SigmaI) = var(accuraciesTest,1);
        
        resultMeanTrain(CI,SigmaI) = mean(accuraciesTrain);
        resultVarianceTrain(CI,SigmaI) = var(accuraciesTrain,1);
    end
end

[~,bestCIndex] = max(max((resultMeanTest')));
[~,bestSigmaIndex] = max(max(resultMeanTest));

% test graphs
figure;
plot((1:64),reshape(resultMeanTest,1,64));
title(' Test data : Mean for different paramaeters c and sigma ');

figure;
plot((1:64),reshape(resultVarianceTest,1,64));
title(' Test data : variance for different paramaeters c and sigma ');

figure;
plot((1:64),reshape(resultMeanTest,1,64));
hold on;
plot((1:64),reshape(resultVarianceTest,1,64));
legend('mean','variance');
title(' Test data : mean and variance for different paramaeters c and sigma ');

% train graphs
figure;
plot((1:64),reshape(resultMeanTrain,1,64));
title(' Tarin data : Mean for different paramaeters c and sigma ');

figure;
plot((1:64),reshape(resultVarianceTrain,1,64));
title(' Train data : variance for different paramaeters c and sigma ');

figure;
plot((1:64),reshape(resultMeanTrain,1,64));
hold on;
plot((1:64),reshape(resultVarianceTrain,1,64));
legend('mean','variance');
title(' Train data : mean and variance for different paramaeters c and sigma ');

bestCIndex
bestSigmaIndex

parameters(bestCIndex)
parameters(bestSigmaIndex)

resultMeanTest(bestCIndex,bestSigmaIndex)
