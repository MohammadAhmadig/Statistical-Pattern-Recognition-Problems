% loading saved images
load('saved_images');

[nimages,mu] = zero_mean(images);

mseV = zeros(1,1000);

for k = 1:1000
    [rimages,V] = pca(nimages,k);
    reimages = rimages*V';
    mse = (reimages - nimages) .^ 2;
    mseV(k) = sum(sum(mse))/(2*630);    
end

xs = 1:1000;
plot(xs,mseV);
xlabel(' k (# of dimensions in pca)');
ylabel(' mse ');