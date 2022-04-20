load('hwDataset1.mat');

% c = 1
c = 1;
SVMModel = fitcsvm(X,y,'Standardize',true,'ClassNames',[1,0],'BoxConstraint',c);
[label,score] = predict(SVMModel,X);

accuracy = find_accuracy(y,label);
disp('accuarcy for c = ');
c
accuracy

figure;
for i = 1:size(X,1)
    if(y(i) == 0)
        plot(X(i,1),X(i,2),'.r');
        hold on;
    else
        plot(X(i,1),X(i,2),'*b');
        hold on;
    end
end

d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
[~,scores] = predict(SVMModel,xGrid);
plot(X(SVMModel.IsSupportVector,1),X(SVMModel.IsSupportVector,2),'ko');
contour(x1Grid,x2Grid,reshape(scores(:,2),size(x1Grid)),[0 0],'k');

% c = 1
c = 100;
SVMModel = fitcsvm(X,y,'Standardize',true,'ClassNames',[1,0],'BoxConstraint',c);
[label,score] = predict(SVMModel,X);

accuracy = find_accuracy(y,label);
disp('accuarcy for c = ');
c
accuracy

figure;
for i = 1:size(X,1)
    if(y(i) == 0)
        plot(X(i,1),X(i,2),'.r');
        hold on;
    else
        plot(X(i,1),X(i,2),'*b');
        hold on;
    end
end

d = 0.02;
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];
[~,scores] = predict(SVMModel,xGrid);
plot(X(SVMModel.IsSupportVector,1),X(SVMModel.IsSupportVector,2),'ko');
contour(x1Grid,x2Grid,reshape(scores(:,2),size(x1Grid)),[0 0],'k');