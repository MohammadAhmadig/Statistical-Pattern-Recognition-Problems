load('hwDataset2.mat');

parameters = [0.01 0.04 0.1 0.4 1 4 10 40];

resultMeanTest = ones(8,8);
resultVarianceTest = ones(8,8);

resultMeanTrain = ones(8,8);
resultVarianceTrain = ones(8,8);

for cI = 1:8
    for sigmaI = 1:8
        c = parameters(cI);
        sigma = parameters(sigmaI);
        
        accuraciesTest = ones(1,100);
        accuraciesTrain = ones(1,100);
        
        % ten time ten folds
        for i = 1:10
            m = tenfolds(X);

            for j = 1:10          
                testIndex = m(:,j);
                trainIndex1 = m(:,1:(j-1));
                trainIndex2 = m(:,(j+1):end);
                trainIndex = [trainIndex1 trainIndex2];
                trainIndex = reshape(trainIndex,9*size(testIndex,1),1);

                SVMModel = fitcsvm(X(trainIndex,:),y(trainIndex),'KernelFunction','rbf','KernelScale',sigma ...
                    ,'Standardize',true,'ClassNames',[1,0],'BoxConstraint',c);
                
                [label,~] = predict(SVMModel,X(testIndex,:));
                accuracy = find_accuracy(y(testIndex),label);
                accuraciesTest((i-1)*10+j) = accuracy;
                
                [label,~] = predict(SVMModel,X(trainIndex,:));
                accuracy = find_accuracy(y(trainIndex),label);
                accuraciesTrain((i-1)*10+j) = accuracy;
            end    
        end
        resultMeanTest(cI,sigmaI) = mean(accuraciesTest);
        resultVarianceTest(cI,sigmaI) = var(accuraciesTest);
        
        resultMeanTrain(cI,sigmaI) = mean(accuraciesTrain);
        resultVarianceTrain(cI,sigmaI) = var(accuraciesTrain);
    end
end

save('save1');

%load('save1');

[~,bestCIndex] = max(max((resultMeanTest')));
[~,bestSigmaIndex] = max(max(resultMeanTest));

% test figures
figure;
plot((1:64),reshape(resultMeanTest,1,64));
title(' test Mean for different paramaeters c and sigma ');

figure;
plot((1:64),reshape(resultVarianceTest,1,64));
title(' test variance for different paramaeters c and sigma ');

figure;
plot((1:64),reshape(resultMeanTest,1,64));
hold on;
plot((1:64),reshape(resultVarianceTest,1,64));
legend('mean','variance');
title(' test mean and variance for different paramaeters c and sigma ');

% train figures
figure;
plot((1:64),reshape(resultMeanTrain,1,64));
title(' train Mean for different paramaeters c and sigma ');

figure;
plot((1:64),reshape(resultVarianceTrain,1,64));
title(' train variance for different paramaeters c and sigma ');

figure;
plot((1:64),reshape(resultMeanTrain,1,64));
hold on;
plot((1:64),reshape(resultVarianceTrain,1,64));
legend('mean','variance');
title(' train mean and variance for different paramaeters c and sigma ');
