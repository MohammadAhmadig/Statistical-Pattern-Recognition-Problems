% loading saved images
load('saved_images');

figure;
imshow(images,[]);

figure();
for i = 1:630
   h = histogram(images(i,:),(1:255),'LineStyle','none'); 
   hold on;
end


