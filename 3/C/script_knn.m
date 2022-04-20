
load('saved_images');

[nimages_train,mu1] = zero_mean(images);
[nimages_test,mu2] = zero_mean(images_test);

accuracyV = zeros(1,20);
for k = 1:20
    accuracy = 0;    
    
    [rimages_train,V] = pca(nimages_train,k);
    rimages_test = nimages_test*V;
    
    for i = 1:size(images,1)
        label = KNN(rimages_train,rimages_test(i,:));
        if label == ceil(i/21)
            accuracy = accuracy + 1;            
        end        
    end
    accuracyV(k) = (accuracy/size(images,1))*100;    
end

figure();
plot(accuracyV);
xlabel('k (# of dimensions in pca)');
ylabel(' % accuracy');
