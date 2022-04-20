
load('save1');
[v,~] = svd(Sb);

[rimages_train,r] = dlda(images, 2, Sb, Sw,v);
rimages_train = rimages_train';
save('dlda_reduce_dim');
