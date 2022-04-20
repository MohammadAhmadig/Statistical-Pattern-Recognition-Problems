
load('trainExtra.mat');
load('testExtra.mat');

parameters = 1:50:700;
n = length(parameters);

accuracies = ones(n,n);

for i = 1:length(parameters)
    for j = 1:length(parameters)
        c = parameters(i);
        sigma = parameters(j);
        
        SVMModel = fitcsvm(X,y,'KernelFunction','rbf','KernelScale',sigma ...
            ,'Standardize',true,'ClassNames',[1,0],'BoxConstraint',c);
        [label,~] = predict(SVMModel,Xtest);
        accuracies(i,j) = find_accuracy(ytest,label);
    end
end

save('save1');


load('save1');

[~,bestCIndex] = max(max((accuracies')));
[~,bestSigmaIndex] = max(max(accuracies));

disp('c:');
parameters(bestCIndex)

disp('sigma:');
parameters(bestSigmaIndex)

disp('best accuracy:')
accuracies(bestCIndex,bestSigmaIndex)

figure;
plot((1:n*n),reshape(accuracies,1,n*n));
title(' accuracies for test dataset ');