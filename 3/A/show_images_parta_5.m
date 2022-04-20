
image_list = dir('Dataset/run/*.png');

for i= 1:30
    bot = imread(strcat('Dataset/run/',image_list(i).name));
    subplot(5,6,i)
    
    imshow(bot);
    i
end
