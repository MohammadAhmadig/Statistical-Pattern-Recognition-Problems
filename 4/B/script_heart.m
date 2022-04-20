load('heart.dat');

ks = [1 3 5 7];

resultMean = ones(1,length(ks));
resultVariance = ones(1,length(ks));

for k = 1:length(ks)
    accuracies = ones(1,100);
    % ten times ten fold
    for i = 1:10
        m = tenfolds(heart);
        for j = 1:10
            [trainIndex,testIndex] = tenfoldsIndexes(m,j);
            
            XTrain = heart(trainIndex,:);
            XTest = heart(testIndex,:);
            
            XTrain1 = XTrain(XTrain(:,14) == 1,:);
            XTrain2 = XTrain(XTrain(:,14) == 2,:);
            
            % train
            gmmC1 = fitgmdist(XTrain1(:,1:13),ks(k),'RegularizationValue',1e-6);
            gmmC2 = fitgmdist(XTrain2(:,1:13),ks(k),'RegularizationValue',1e-6);
            
            % test
            numCorrect = 0;
            for iTest = 1:size(XTest,1)
                x = XTest(iTest,1:13);
                p1 = pdf(gmmC1,x);
                p2 = pdf(gmmC2,x);
                
                if p1 > p2
                    % class 1 detected
                    if( XTest(iTest,14) == 1 )
                        numCorrect = numCorrect+1;
                    end
                else
                    % class 2 detected
                    if( XTest(iTest,14) == 2 )
                        numCorrect = numCorrect+1;
                    end
                end
            end
            accuracy = numCorrect/size(XTest,1);
            accuracies((i-1)*10+j) = accuracy;
        end
    end
    resultMean(k) = mean(accuracies);
    resultVariance(k) = var(accuracies);
end

figure;
plot(ks,resultMean);
xlabel('k');
ylabel('mean');
title(' mean of accuracies for k = 1,3,5,7 (heart dataset)');

figure;
plot(ks,resultVariance);
xlabel('k');
ylabel('variance');
title(' variance of accuracies for k = 1,3,5,7 (heart dataset)');

figure;
plot(ks,resultMean,'r');
hold on;
plot(ks,resultVariance,'b');
legend('mean','variance');
title(' mean and variance of accuracies for k = 1,3,5,7 (heart dataset)');

[bestAccuracy,bestIndex] = max(resultMean);
bestAccuracy
disp('best result heart dataset');
ks(bestIndex)
