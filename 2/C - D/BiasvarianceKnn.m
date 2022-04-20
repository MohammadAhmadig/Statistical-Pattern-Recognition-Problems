function  [B,p]  = BiasvarianceKnn( realp, K )
%BIASVARIANCEKNN Summary of this function goes here
%   Detailed explanation goes here
step = 1;
x = (-7:step:20)';
y = (-7:step:20)';

p = zeros(size(x,1),size(y,1));


mu2 = [5 3];
sigma2 = [2 1 ; 1 2];

data2 =  mvnrnd(mu2,sigma2,500);



for i=1:size(x,1)
   for j=1:size(y,1)
            p(i,j) = K/((VKNN(x(i),y(j),data2(:,1),data2(:,2),K)*size(data2,1)));
   end
end

B = abs(realp - p );
end

