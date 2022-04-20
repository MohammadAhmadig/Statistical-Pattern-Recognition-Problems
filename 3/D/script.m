%{
image = double(imread('128_128_24Bit.png'));

R = reshape(image(:,:,1)',1,128*128);
G = reshape(image(:,:,2)',1,128*128);
B = reshape(image(:,:,3)',1,128*128);

x = [ R ; G; B];
x = x';

[u,mu] = kmeans(x,16,255);

save('save1');
%}
load('save1');

for i = 1:128
    for j = 1:128
        index = (i-1)*128+j;
        [~,kIndex] = max(u(index,:));
        image(i,j,:) = mu(kIndex,:);
    end
end

imshow(uint8(round(image)));