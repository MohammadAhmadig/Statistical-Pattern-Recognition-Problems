load('saved_images');

[nimages_train,mu1] = zero_mean(images);
[nimages_test,mu2] = zero_mean(images_test);
[rimages_train,V] = pca(nimages_train,2);

save('pca_reduce_dim');
 