
Address = 'C:\Program Files\MATLAB\MATLAB Production Server\R2012b\bin\hw2_SPR\lingspam\';
trainAddress = strcat(Address,'training\');
testAddress = strcat(Address,'test\');
TrainFolderInfo = dir(trainAddress);
TestFolderInfo = dir(testAddress);

Num_of_train = length(TrainFolderInfo(not([TrainFolderInfo.isdir])))
Num_of_test = length(TestFolderInfo(not([TestFolderInfo.isdir])))
dictionary = {};
Num_of_nospam = 241;
Num_of_spam = 96;
Num_of_class = 2;
%-------------------------------------------
train_data = cell(Num_of_train,1);
test_data = cell(Num_of_test,1);
for i = 3 : (Num_of_train+2)
    s=strcat(trainAddress,num2str(TrainFolderInfo(i).name));
    fileID = fopen(s,'r');
    data = textscan(fileID,'%s');
    
    data = unique(data{1});
    train_data{(i-2)} = data;
    for j = 1 : size(data,1)%size(data{1},1)
        dictionary=[dictionary;data(j)];
    end
    dictionary = unique(dictionary);
    %i
    fclose(fileID);
end

dictionary = unique(dictionary);
dict_size = size(dictionary,1);

for i = 3 : (Num_of_test+2)
    %i
    s=strcat(testAddress,num2str(TestFolderInfo(i).name));
    fileID2 = fopen(s,'r');
    data2 = textscan(fileID2,'%s');
    data2 = unique(data2{1});
    test_data{(i-2)} = data2;
    fclose(fileID2);
end

% ------- save data ---------
dictionary1 = char(dictionary);

save('dictionary.m', 'dictionary1', '-ASCII');
%save('train_data.m', 'train_data', '-ASCII');
%save('test_data.m', 'test_data', '-ASCII');

%------- make phi ----------
phi_y = (Num_of_nospam+1) / (Num_of_train + Num_of_class);
phi = phi_i(dict_size , Num_of_nospam,Num_of_spam,Num_of_train,train_data,dictionary);

%-------------- classifier ------------------
[classify , train_classify] = classifier(Num_of_test,Num_of_train,dict_size,test_data,train_data,dictionary,phi,phi_y);

%--------------- test accuracies ----------------
real_classify = [ones(Num_of_nospam,1) ; zeros(Num_of_spam,1)];
likeness = sum(classify == real_classify);
total_accuracy = likeness / Num_of_test
likeness = sum(classify(1:Num_of_nospam) == real_classify(1:Num_of_nospam));
class1_accuracy = likeness / Num_of_nospam
likeness = sum(classify((Num_of_nospam+1):Num_of_test) == real_classify((Num_of_nospam+1):Num_of_test));
class0_accuracy = likeness / Num_of_spam

%--------------- train accuracies ----------------
likeness = sum(train_classify == real_classify);
total_accuracy_train = likeness / Num_of_train
likeness = sum(train_classify(1:Num_of_nospam) == real_classify(1:Num_of_nospam));
class1_accuracy_train = likeness / Num_of_nospam
likeness = sum(train_classify((Num_of_nospam+1):Num_of_train) == real_classify((Num_of_nospam+1):Num_of_train));
class0_accuracy_train = likeness / Num_of_spam

%-------save data-------------
save('phi.data', 'phi', '-ASCII');
save('classify.data', 'classify', '-ASCII');
save('train_classify.data', 'train_classify', '-ASCII');
save('total_accuracy.data', 'total_accuracy', '-ASCII');
save('total_accuracy_train.data', 'total_accuracy_train', '-ASCII');
save('class1_accuracy.data', 'class1_accuracy', '-ASCII');
save('class0_accuracy.data', 'class0_accuracy', '-ASCII');
save('class1_accuracy_train.data', 'class1_accuracy_train', '-ASCII');
save('class0_accuracy_train.data', 'class0_accuracy_train', '-ASCII');

