%{
load('saved_images');

% calculating mu
mu = zeros(30,64*64);

for i = 1:30
    classIndex = (i-1)*21 + 1;
    mu(i,:) = sum(images(classIndex:classIndex+20,:)) / 21;
end

% calculating Sw
Sw = zeros(64*64,64*64);

for i = 1:30
    for j = 1:21
        imageIndex = (i-1)*21 + j;
        temp = (images(imageIndex,:) - mu(i,:));
        Sw = Sw + (temp' * temp);
    end
end

% calculating Sb
muT = sum(images)/21;
Sb = zeros(64*64,64*64);

for i = 1:30
    temp = mu(i,:)-muT();
    Sb = Sb + 21*(temp'*temp);
end

save('save1');
%}
load('save1');
[v,~] = svd(Sb);

accuracyV = zeros(1,20);
for k = 1:20
    accuracy = 0;    
    
    [rimages_train,r] = dlda(images, k, Sb, Sw,v);
    rimages_train = rimages_train';
    rimages_test = (r*images_test')';
    
    for i = 1:size(images,1)
        label = KNN(rimages_train,rimages_test(i,:));
        if label == ceil(i/21)
            accuracy = accuracy + 1;            
        end        
    end
    accuracyV(k) = (accuracy/size(images,1))*100;
    k
    accuracyV(k)
end

figure();
plot(accuracyV);
xlabel('k (# of dimensions in direct LDA)');
ylabel(' % accuracy');
