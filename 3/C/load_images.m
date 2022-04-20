% train data
image_list = dir('Dataset/train/*.png');

images = zeros(630,64*64);

for i = 1:length(image_list)
    a = imread(strcat('Dataset/train/',image_list(i).name));
    b = rgb2gray(a);
    c = imresize(b,0.5);
    d = reshape(c',1,64*64);
    images(i,:) = d;
    i
end

% test data
image_list_test = dir('Dataset/test/*.png');

images_test = zeros(630,64*64);

for i = 1:length(image_list_test)
    a = imread(strcat('Dataset/test/',image_list_test(i).name));
    b = rgb2gray(a);
    c = imresize(b,0.5);
    d = reshape(c',1,64*64);
    images_test(i,:) = d;
    i
end

save('saved_images');
