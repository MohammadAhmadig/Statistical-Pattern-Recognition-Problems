% loading saved images
load('saved_images');

[nimages,mu] = zero_mean(images);

% visualizing for k = 2
k = 10;
[rimages,V] = pca(nimages,k);

plotimg = reshape(V(:,1),64,64);
figure;
imshow(plotimg',[]);

plotimg = reshape(V(:,2),64,64);
figure;
imshow(plotimg',[]);

plotimg = reshape(V(:,3),64,64);
figure;
imshow(plotimg',[]);

plotimg = reshape(V(:,4),64,64);
figure;
imshow(plotimg',[]);

plotimg = reshape(V(:,5),64,64);
figure;
imshow(plotimg',[]);
