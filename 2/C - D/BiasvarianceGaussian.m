function [B,p]  = BiasvarianceGaussian( realp, stdev )



step = 1;
x = (-7:step:20)';
y = (-7:step:20)';


p = zeros(size(x,1),size(y,1));

mu2 = [5 3];
sigma2 = [2 1 ; 1 2];

data2 =  mvnrnd(mu2,sigma2,500);


for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data2,1)
            p(i,j) = p(i,j) + GaussianKernel(x(i),y(j),data2(k,1),data2(k,2),step,stdev);
       end
   end
   
end
p = p/(size(data2,1) * step^2);

B = abs(realp - p );



    

end

