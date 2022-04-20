function [ p ] = Parzenwithgaussian( data,step,stdev )
%PARZENWITHGAUSSIAN Summary of this function goes here
%   Detailed explanation goes here

x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));


for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data,1)
            p(i,j) = p(i,j) + GaussianKernel(x(i),y(j),data(k,1),data(k,2),step,stdev);
       end
   end
   
end
p = p/(size(data,1) * step^2);


end

