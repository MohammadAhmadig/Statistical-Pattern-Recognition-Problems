% loading saved images

load('saved_images');

[nimages,mu] = zero_mean(images);

% visualizing for k = 2
k = 2;
[rimages,V] = pca(nimages,k);

figure;
plot(rimages(:,1),rimages(:,2),'.');
title('data reduced to 2 dimensions. pca k = 2');

% visualizing for k = 2
k = 3;
[rimages,V] = pca(nimages,k);

figure;
plot3(rimages(:,1),rimages(:,2),rimages(:,3),'.');
title('data reduced to 3 dimensions. pca k = 3');
