image = double(imread('128_128_24Bit.png'));

R = reshape(image(:,:,1)',1,128*128);
G = reshape(image(:,:,2)',1,128*128);
B = reshape(image(:,:,3)',1,128*128);

x = [ R ; G; B];
x = x';

m = size(x,1);
jv = zeros(1,100);

for k = 1:100
    [u,mu] = kmeans(x,k,255);
    
    j = 0;
    for i = 1:m
        [~,kIndex] = max(u(i,:));
        j = j + sum((x(i,:)-mu(kIndex,:)).^2);
    end
    jv(k) = j;
    k
end
figure;
plot(jv);
