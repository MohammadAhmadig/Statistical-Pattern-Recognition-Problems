%{
% loading saved images
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

k = 1;
[rimages,r] = dlda(images, k, Sb, Sw,v);
% reconstructing
reimages = (r' * rimages)';

% plotting image
plotimg = reshape(reimages(1,:),64,64);
figure;
imshow(plotimg',[]);

k = 6;
[rimages,r] = dlda(images, k, Sb, Sw,v);
% reconstructing
reimages = (r' * rimages)';

% plotting image
plotimg = reshape(reimages(1,:),64,64);
figure;
imshow(plotimg',[]);

k = 29;
[rimages,r] = dlda(images, k, Sb, Sw,v);
% reconstructing
reimages = (r' * rimages)';

% plotting image
plotimg = reshape(reimages(1,:),64,64);
figure;
imshow(plotimg',[]);
