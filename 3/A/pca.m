function [ rimages,V ] = pca(images, k)
    [~,~,V] = svd(images);
    V = V(:,1:k);
    rimages = images*V;
end