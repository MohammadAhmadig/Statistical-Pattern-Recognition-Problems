load('myxaa.dat');

ks = [1 3 5 7];

resultMean = ones(1,length(ks));
resultVariance = ones(1,length(ks));

for k = 1:length(ks)
    accuracies = ones(1,100);
    % ten times ten fold
    for i = 1:10
        m = tenfolds(myxaa);
        for j = 1:10
            [trainIndex,testIndex] = tenfoldsIndexes(m,j);
            
            XTrain = myxaa(trainIndex,:);
            XTest = myxaa(testIndex,:);
            
            XTrain1 = XTrain(XTrain(:,19) == 1,:);
            XTrain2 = XTrain(XTrain(:,19) == 2,:);
            XTrain3 = XTrain(XTrain(:,19) == 3,:);
            XTrain4 = XTrain(XTrain(:,19) == 4,:);
            
            numbersToAdd = 6;
            if(size(XTrain1,1) < 20)
                duplicateIndex = randi(size(XTrain1,1),numbersToAdd);
                XTrain1 = [XTrain1 ; XTrain1(duplicateIndex,:)];
            end
            
            if(size(XTrain2,1) < 20)
                duplicateIndex = randi(size(XTrain2,1),numbersToAdd);
                XTrain2 = [XTrain2 ; XTrain2(duplicateIndex,:)];
            end
            
            if(size(XTrain3,1) < 20)
                duplicateIndex = randi(size(XTrain3,1),numbersToAdd);
                XTrain3 = [XTrain3 ; XTrain3(duplicateIndex,:)];
            end
            
            if(size(XTrain4,1) < 20)
                duplicateIndex = randi(size(XTrain4,1),numbersToAdd);
                XTrain4 = [XTrain4 ; XTrain4(duplicateIndex,:)];
            end
            
            % train
            gmmC1 = fitgmdist(XTrain1(:,1:18),ks(k),'RegularizationValue',1e-6);
            gmmC2 = fitgmdist(XTrain2(:,1:18),ks(k),'RegularizationValue',1e-6);
            gmmC3 = fitgmdist(XTrain3(:,1:18),ks(k),'RegularizationValue',1e-6);
            gmmC4 = fitgmdist(XTrain4(:,1:18),ks(k),'RegularizationValue',1e-6);
            
            % test
            numCorrect = 0;
            for iTest = 1:size(XTest,1)
                x = XTest(iTest,1:18);
                p1 = pdf(gmmC1,x);
                p2 = pdf(gmmC2,x);
                p3 = pdf(gmmC3,x);
                p4 = pdf(gmmC4,x);
                
                [~,class] = max([p1,p2,p3,p4]);
                                
                if class == XTest(iTest,19)
                    numCorrect = numCorrect + 1;
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
title(' mean of accuracies for k = 1,3,5,7 (vehicle dataset)');

figure;
plot(ks,resultVariance);
xlabel('k');
ylabel('variance');
title(' variance of accuracies for k = 1,3,5,7 (vehicle dataset)');

figure;
plot(ks,resultMean,'r');
hold on;
plot(ks,resultVariance,'b');
legend('mean','variance');
title(' mean and variance of accuracies for k = 1,3,5,7 (vehicle dataset)');

[bestAccuracy,bestIndex] = max(resultMean);
bestAccuracy
disp('best result vehicle dataset');
ks(bestIndex)
