% loading saved images
load('saved_images');
[nimages,mu] = zero_mean(images);

k = 1;
[rimages,V] = pca(nimages,k);
reimages = rimages*V';
reimages = de_zero_mean(reimages,mu);
for i = 1:21:630
    plotimg = reshape(reimages(i,:),64,64);
    figure;
    imshow(plotimg',[]);    
end
    

k = 30;
[rimages,V] = pca(nimages,k);
reimages = rimages*V';
reimages = de_zero_mean(reimages,mu);
for i = 1:21:630
    plotimg = reshape(reimages(i,:),64,64);
    figure;
    imshow(plotimg',[]);    
end

k = 120;
[rimages,V] = pca(nimages,k);
reimages = rimages*V';
reimages = de_zero_mean(reimages,mu);
for i = 1:21:630
    plotimg = reshape(reimages(i,:),64,64);
    figure;
    imshow(plotimg',[]);    
end
