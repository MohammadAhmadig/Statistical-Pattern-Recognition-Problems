load('save1');
[v,~] = svd(Sb);
k = 2;    
[rimages_train,r] = dlda(images, k, Sb, Sw,v);
rimages_train = rimages_train';

