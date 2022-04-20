function [ meanerror ] = CrossValidation( data, step )
%CROSSVALIDATION Summary of this function goes here
%   Detailed explanation goes here

mu1 = [1 4];
sigma1 = [3 0 ; 0 2];

subdata1test = data(1:200,:);
subdata1train = data(201:1000,:);

subdata2test = data(201:400,:);
subdata2train = [data(1:200,:) ; data(401:1000,:)] ;


subdata3test = data(401:600,:);
subdata3train = [data(1:400,:) ; data(601:1000,:)] ;

subdata4test = data(601:800,:);
subdata4train = [data(1:600,:) ; data(801:1000,:)] ;

subdata5test = data(801:1000,:);
subdata5train = data(1:800,:) ;


stdev = 0.6;

Py1 = @(x,y) (1/((2*pi) * det(sigma1)^0.5)) * exp(-0.5 * ([x y] - mu1) * inv(sigma1) * ([x y] - mu1)');

%----------------0.6 1----------------
p = zeros(200,1);
realp = zeros(200,1);
for i = 1:200
       for k = 1:800
            p(i) = p(i) + GaussianKernel(subdata1test(i,1),subdata1test(i,2),subdata1train(k,1),subdata1train(k,2),step,stdev);
       end
	   realp(i) = Py1(subdata1test(i,1),subdata1test(i,2));
end
p = p/(size(data,1) * step^2);
sqerror = (p - realp).^2;

error1 = sum(sqerror);

%----------------0.6 2----------------
p = zeros(200,1);
realp = zeros(200,1);

for i = 1:200
       for k = 1:800
            p(i) = p(i) + GaussianKernel(subdata2test(i,1),subdata2test(i,2),subdata2train(k,1),subdata2train(k,2),step,stdev);
            
       end
	   realp(i) = Py1(subdata1test(i,1),subdata1test(i,2));
end
p = p/(size(data,1) * step^2);
sqerror = (p - realp).^2;

error2 = sum(sqerror);

%---------------- 3 ----------------
p = zeros(200,1);
realp = zeros(200,1);

for i = 1:200
       for k = 1:800
            p(i) = p(i) + GaussianKernel(subdata3test(i,1),subdata3test(i,2),subdata3train(k,1),subdata3train(k,2),step,stdev);
            
       end
	   realp(i) = Py1(subdata1test(i,1),subdata1test(i,2));
end
p = p/(size(data,1) * step^2);
sqerror = (p - realp).^2;

error3 = sum(sqerror);
%---------------- 4 ----------------
p = zeros(200,1);
realp = zeros(200,1);

for i = 1:200
       for k = 1:800
            p(i) = p(i) + GaussianKernel(subdata4test(i,1),subdata4test(i,2),subdata4train(k,1),subdata4train(k,2),step,stdev);
            
       end
	   realp(i) = Py1(subdata1test(i,1),subdata1test(i,2));
end
p = p/(size(data,1) * step^2);
sqerror = (p - realp).^2;

error4 = sum(sqerror);
%---------------- 5 ----------------
p = zeros(200,1);
realp = zeros(200,1);

for i = 1:200
       for k = 1:800
            p(i) = p(i) + GaussianKernel(subdata5test(i,1),subdata5test(i,2),subdata5train(k,1),subdata5train(k,2),step,stdev);
            
       end
	   realp(i) = Py1(subdata1test(i,1),subdata1test(i,2));
end
p = p/(size(data,1) * step^2);
sqerror = (p - realp).^2;

error5 = sum(sqerror);

meanerror = (error1+error2+error3+error4+error5)/5;

end

