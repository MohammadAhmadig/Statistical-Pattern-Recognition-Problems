


data = ReadData('training_images');
labels = load('training_labels');

data = Addfeature(data);


estlabels = NumberEstimation(data,labels,data);

n = estlabels == labels;
Totalaccuracy = (sum(n)/5000)*100

dif = [labels estlabels];

v0 = dif(dif(:,1) == 0,:);
accuracy0 = size(v0(v0(:,1)==v0(:,2),:),1)/size(v0,1) * 100;

v1 = dif(dif(:,1) == 1,:);
accuracy1 = size(v1(v1(:,1)==v1(:,2),:),1)/size(v1,1) * 100;

v2 = dif(dif(:,1) == 2,:);
accuracy2 = size(v2(v2(:,1)==v2(:,2),:),1)/size(v2,1) * 100;

v3 = dif(dif(:,1) == 3,:);
accuracy3 = size(v3(v3(:,1)==v3(:,2),:),1)/size(v3,1) * 100;

v4 = dif(dif(:,1) == 4,:);
accuracy4 = size(v4(v4(:,1)==v4(:,2),:),1)/size(v4,1) * 100;

v5 = dif(dif(:,1) == 5,:);
accuracy5 = size(v5(v5(:,1)==v5(:,2),:),1)/size(v5,1) * 100;

v6 = dif(dif(:,1) == 6,:);
accuracy6 = size(v6(v6(:,1)==v6(:,2),:),1)/size(v6,1) * 100;

v7 = dif(dif(:,1) == 7,:);
accuracy7 = size(v7(v7(:,1)==v7(:,2),:),1)/size(v7,1) * 100;

v8 = dif(dif(:,1) == 8,:);
accuracy8 = size(v8(v8(:,1)==v8(:,2),:),1)/size(v8,1) * 100;

v9 = dif(dif(:,1) == 9,:);
accuracy9 = size(v9(v9(:,1)==v9(:,2),:),1)/size(v9,1) * 100;


%---------------------Test---------------------

testdata = ReadData('test_images');
testdata = Addfeature(testdata);
testlabels = load('test_labels');


estlabels = NumberEstimation(data,labels,testdata);

fig = figure;
plot(1:1000,estlabels,'b+');
hold on;
plot(1:1000,testlabels(1:1000),'rO');
xlabel('Index');
ylabel('Numbers');
title('Number Estimation');
legend('Estimated Values','True Values');


n = estlabels == testlabels(1:1000);
Totalaccuracy = (sum(n)/1000)*100;

dif = [testlabels estlabels];

v0 = dif(dif(:,1) == 0,:);
accuracy0 = size(v0(v0(:,1)==v0(:,2),:),1)/size(v0,1) * 100;

v1 = dif(dif(:,1) == 1,:);
accuracy1 = size(v1(v1(:,1)==v1(:,2),:),1)/size(v1,1) * 100;

v2 = dif(dif(:,1) == 2,:);
accuracy2 = size(v2(v2(:,1)==v2(:,2),:),1)/size(v2,1) * 100;

v3 = dif(dif(:,1) == 3,:);
accuracy3 = size(v3(v3(:,1)==v3(:,2),:),1)/size(v3,1) * 100;

v4 = dif(dif(:,1) == 4,:);
accuracy4 = size(v4(v4(:,1)==v4(:,2),:),1)/size(v4,1) * 100;

v5 = dif(dif(:,1) == 5,:);
accuracy5 = size(v5(v5(:,1)==v5(:,2),:),1)/size(v5,1) * 100;

v6 = dif(dif(:,1) == 6,:);
accuracy6 = size(v6(v6(:,1)==v6(:,2),:),1)/size(v6,1) * 100;

v7 = dif(dif(:,1) == 7,:);
accuracy7 = size(v7(v7(:,1)==v7(:,2),:),1)/size(v7,1) * 100;

v8 = dif(dif(:,1) == 8,:);
accuracy8 = size(v8(v8(:,1)==v8(:,2),:),1)/size(v8,1) * 100;

v9 = dif(dif(:,1) == 9,:);
accuracy9 = size(v9(v9(:,1)==v9(:,2),:),1)/size(v9,1) * 100;





















