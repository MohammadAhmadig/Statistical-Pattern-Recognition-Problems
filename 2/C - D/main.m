

mu1 = [1 4];
sigma1 = [3 0 ; 0 2];
data1 =  mvnrnd(mu1,sigma1,1000);

mu2 = [5 3];
sigma2 = [2 1 ; 1 2];
data2 =  mvnrnd(mu2,sigma2,1000);

data = [data1 ; data2];

mu1est = sum(data1)/1000;
mu2est = sum(data2)/1000;

sigma1est = zeros(2);
for i = 1:size(data1,1)
    sigma1est = sigma1est + (data1(i,:) - mu1est)'*(data1(i,:) - mu1est);
end
sigma1est = sigma1est/1000 ;

sigma2est = zeros(2);
for i = 1:size(data2,1)
    sigma2est = sigma2est + (data2(i,:) - mu2est)'*(data2(i,:) - mu2est);
end
sigma2est = sigma2est/1000 ;



Py1est = @(x,y) 0.5 * (1/((2*pi) * det(sigma1est)^0.5)) * exp(-0.5 * ([x y] - mu1est) * inv(sigma1est) * ([x y] - mu1est)');
Py1 = @(x,y) 0.5 * (1/((2*pi) * det(sigma1)^0.5)) * exp(-0.5 * ([x y] - mu1) * inv(sigma1) * ([x y] - mu1)');

Py2 = @(x,y) 0.5 * (1/((2*pi) * det(sigma2)^0.5)) * exp(-0.5 * ([x y] - mu2) * inv(sigma2) * ([x y] - mu2)');
Py2est = @(x,y) 0.5 * (1/((2*pi) * det(sigma2est)^0.5)) * exp(-0.5 * ([x y] - mu2est) * inv(sigma2est) * ([x y] - mu2est)');


fig = figure;
ezsurf(Py1,[-6,12,-6,12]);
hold on
ezsurf(Py2,[-6,12,-6,12]);
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Real PDFs');


fig2 = figure;
ezsurf(Py1est,[-6,12,-6,12]);
hold on
ezsurf(Py2est,[-6,12,-6,12]);
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Estimated PDFs');


%-----------------------------D------------------------------

%-------------------------histogram 0.6--------------------------


step = 0.6;

x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(x,1));

for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data,1)
           if data(k,1)> x(i) && data(k,1)< x(i+1)
               if data(k,2)> y(j) && data(k,2)< y(j+1)
                   p(i,j)= p(i,j)+1;
               end
           end
      
       end
       
   end
end
p = p/(size(data,1) * step^2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Histogram PDF with H=0.6');

%-------------------------histogram 0.3--------------------------



step = 0.3;

x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(x,1));

for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data,1)
           if data(k,1)> x(i) && data(k,1)< x(i+1)
               if data(k,2)> y(j) && data(k,2)< y(j+1)
                   p(i,j)= p(i,j)+1;
               end
           end
      
       end
       
   end
end
p = p/(size(data,1) * step^2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Histogram PDF with H=0.3');

%-------------------------histogram 0.09--------------------------



step = 0.09;

x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(x,1));

for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data,1)
           if data(k,1)> x(i) && data(k,1)< x(i+1)
               if data(k,2)> y(j) && data(k,2)< y(j+1)
                   p(i,j)= p(i,j)+1;
               end
           end
      
       end
       
   end
end
p = p/(size(data,1) * step^2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Histogram PDF with H=0.09');


%----------------------Parzen Windows 0.6--------------------------


step = 0.6;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));


for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data,1)
            p(i,j) = p(i,j) + Kernel(x(i),y(j),data(k,1),data(k,2),step);
       end
   end
   
end
p = p/(size(data,1) * step^2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end

xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Parzen Window PDF with H=0.6');

%----------------------Parzen Windows 0.3--------------------------




step = 0.3;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));


for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data,1)
            p(i,j) = p(i,j) + Kernel(x(i),y(j),data(k,1),data(k,2),step);
       end
   end
   
end
p = p/(size(data,1) * step^2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end

xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Parzen Window PDF with H=0.3');

%----------------------Parzen Windows 0.09--------------------------




step = 0.09;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));


for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data,1)
            p(i,j) = p(i,j) + Kernel(x(i),y(j),data(k,1),data(k,2),step);
       end
   end
   
end
p = p/(size(data,1) * step^2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end

xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Parzen Window PDF with H=0.09');



%----------------  Parzen with Gaussian Kernel 0.6 -------------




p = Parzenwithgaussian(data,0.6,0.2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.6 & Sigma = 0.2');

%----------------  Parzen with Gaussian Kernel 0.6 -------------



p = Parzenwithgaussian(data,0.6,0.6);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.6 & Sigma = 0.6');
%----------------  Parzen with Gaussian Kernel 0.6 -------------



p = Parzenwithgaussian(data,0.6,0.9);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.6 & Sigma = 0.9');


%----------------  Parzen with Gaussian Kernel 0.3 -------------

p = Parzenwithgaussian(data,0.3,0.2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.3 & Sigma = 0.2');
%----------------  Parzen with Gaussian Kernel 0.3 -------------

p = Parzenwithgaussian(data,0.3,0.6);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.3 & Sigma = 0.6');

%----------------  Parzen with Gaussian Kernel 0.3 -------------

p = Parzenwithgaussian(data,0.3,0.9);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.3 & Sigma = 0.9');

%----------------  Parzen with Gaussian Kernel 0.09 -------------

p = Parzenwithgaussian(data,0.09,0.2);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.09 & Sigma = 0.2');

%----------------  Parzen with Gaussian Kernel 0.09 -------------

p = Parzenwithgaussian(data,0.09,0.6);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.09 & Sigma = 0.6');

%----------------  Parzen with Gaussian Kernel 0.09 -------------

p = Parzenwithgaussian(data,0.09,0.9);

fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Gaussian Kernel  H=0.09 & Sigma = 0.9');

%------------------------KNN 0.6 K=1------------------------
step = 0.6;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 1;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.6 & K = 1');

%------------------------KNN 0.6 K=11------------------------
step = 0.6;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 11;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.6 & K = 11');

%------------------------KNN 0.6 K=111------------------------
step = 0.6;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 111;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.6 & K = 111');


%------------------------KNN 0.3 K=1------------------------
step = 0.3;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 1;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.3 & K = 1');

%------------------------KNN 0.3 K=11------------------------
step = 0.3;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 11;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.3 & K = 11');

%------------------------KNN 0.3 K=111------------------------
step = 0.3;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 111;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.3 & K = 111');



%------------------------KNN 0.09 K=1------------------------
step = 0.09;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 1;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.09 & K = 1');

%------------------------KNN 0.09 K=11------------------------
step = 0.09;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 11;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.09 & K = 11');

%------------------------KNN 0.09 K=111------------------------
step = 0.09;
x = (-6:step:12)';
y = (-6:step:12)';
p = zeros(size(x,1),size(y,1));
K = 111;

for i=1:size(x,1)
   for j=1:size(y,1)
       
            p(i,j) = K/((VKNN(x(i),y(j),data(:,1),data(:,2),K)*size(data,1)));
       
   end
   
end


fig1 = figure;

b = bar3(p,1);

%Bar Coloring Script 
set(gca,'XTickLabel',' ');
set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('KNN  H=0.09 & K = 111');





%------------------5-Fold Class Validation----------------------

mu1 = [1 4];
sigma1 = [3 0 ; 0 2];
data1 =  mvnrnd(mu1,sigma1,1000);

e1 = CrossValidation(data1,0.6);
e1 
% The best is 0.6

e2 = CrossValidation(data1,0.3);
e2
e3 = CrossValidation(data1,0.09);
e3







%--------------------  Bias - Variance  ----------------




step = 1;
x = (-7:step:20)';
y = (-7:step:20)';
realp = zeros(size(x,1),size(y,1));

mu2 = [5 3];
sigma2 = [2 1 ; 1 2];
data2 =  mvnrnd(mu2,sigma2,500);

py1 = @(x,y) (0.5)*(1/((2*pi) * det(sigma2)^0.5)) * exp(-0.5 * ([x y] - mu2) * inv(sigma2) * ([x y] - mu2)');
for i=1:size(x,1)
   for j=1:size(y,1)
       for k = 1:size(data2,1)
            realp(i,j) = py1(x(i),y(j));
       end
   end
   
end
%Gaussian Kernel 
%------------------------0.6-----------------------


[B1,P1] = BiasvarianceGaussian(realp, 0.6);
[B2,P2] = BiasvarianceGaussian(realp, 0.6);
[B3,P3] = BiasvarianceGaussian(realp, 0.6);
[B4,P4] = BiasvarianceGaussian(realp, 0.6);
[B5,P5] = BiasvarianceGaussian(realp, 0.6);
Bfinal = (B1 + B2 + B3 + B4 + B5)/5;

Varmatrix(:,:,1)  = P1;
Varmatrix(:,:,2)  = P2;
Varmatrix(:,:,3)  = P3;
Varmatrix(:,:,4)  = P4;
Varmatrix(:,:,5)  = P5;

Varmatrixfinal = var(Varmatrix,0,3);

fig1 = figure;

b = bar3(Bfinal,1);

%Bar Coloring Script 
%set(gca,'XTickLabel',' ');
%set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
title('Bias of Gaussian Kernel (0.6)');

fig2 = figure;

b = bar3(Varmatrixfinal,1);

%Bar Coloring Script 
%set(gca,'XTickLabel',' ');
%set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
title('Variance of Gaussian Kernel (0.6)');


%---------------------0.2-------------------------



[B1,P1] = BiasvarianceGaussian(realp, 0.6);
[B2,P2] = BiasvarianceGaussian(realp, 0.6);
[B3,P3] = BiasvarianceGaussian(realp, 0.6);
[B4,P4] = BiasvarianceGaussian(realp, 0.6);
[B5,P5] = BiasvarianceGaussian(realp, 0.6);
Bfinal = (B1 + B2 + B3 + B4 + B5)/5;

Varmatrix(:,:,1)  = P1;
Varmatrix(:,:,2)  = P2;
Varmatrix(:,:,3)  = P3;
Varmatrix(:,:,4)  = P4;
Varmatrix(:,:,5)  = P5;

Varmatrixfinal = var(Varmatrix,0,3);

fig1 = figure;

b = bar3(Bfinal,1);

%Bar Coloring Script 
%set(gca,'XTickLabel',' ');
%set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
title('Bias of Gaussian Kernel (0.2)');

fig2 = figure;

b = bar3(Varmatrixfinal,1);

%Bar Coloring Script 
%set(gca,'XTickLabel',' ');
%set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
title('Variance of Gaussian Kernel (0.2)');

%------------------- Knn ------------------

%-------------------k = 1------------------


[B1,P1] = BiasvarianceKnn(realp, 1);
[B2,P2] = BiasvarianceKnn(realp, 1);
[B3,P3] = BiasvarianceKnn(realp, 1);
[B4,P4] = BiasvarianceKnn(realp, 1);
[B5,P5] = BiasvarianceKnn(realp, 1);
Bfinal = (B1 + B2 + B3 + B4 + B5)/5;

Varmatrix(:,:,1)  = P1;
Varmatrix(:,:,2)  = P2;
Varmatrix(:,:,3)  = P3;
Varmatrix(:,:,4)  = P4;
Varmatrix(:,:,5)  = P5;

Varmatrixfinal = var(Varmatrix,0,3);


b = bar3(Bfinal,1);

%Bar Coloring Script 
%set(gca,'XTickLabel',' ');
%set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
title('Bias of KNN (K=1)');

fig2 = figure;

b = bar3(Varmatrixfinal,1);

%Bar Coloring Script 
%set(gca,'XTickLabel',' ');
%set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
title('Variance of KNN (K=1)');


%-------------------k = 111------------------

[B1,P1] = BiasvarianceKnn(realp, 111);
[B2,P2] = BiasvarianceKnn(realp, 111);
[B3,P3] = BiasvarianceKnn(realp, 111);
[B4,P4] = BiasvarianceKnn(realp, 111);
[B5,P5] = BiasvarianceKnn(realp, 111);
Bfinal = (B1 + B2 + B3 + B4 + B5)/5;

Varmatrix(:,:,1)  = P1;
Varmatrix(:,:,2)  = P2;
Varmatrix(:,:,3)  = P3;
Varmatrix(:,:,4)  = P4;
Varmatrix(:,:,5)  = P5;

Varmatrixfinal = var(Varmatrix,0,3);

fig1 = figure;

b = bar3(Bfinal,1);

%Bar Coloring Script 
%set(gca,'XTickLabel',' ');
%set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
title('Bias of KNN (K=111)');

fig2 = figure;

b = bar3(Varmatrixfinal,1);

%Bar Coloring Script 
%set(gca,'XTickLabel',' ');
%set(gca,'YTickLabel',' ');
for k = 1:length(b)
    zdata = get(b(k),'ZData');
    set(b(k),'CData', zdata);
    set(b(k),'FaceColor', 'interp')
    
end
xlabel('X1');
ylabel('X2');
title('Variance of KNN (K=111)');

%----------------------- 5 ------------------------

mu1 = [1 4];
sigma1 = [3 0 ; 0 2];
data1 =  [mvnrnd(mu1,sigma1,1000) zeros(1000,1)];

mu2 = [5 3];
sigma2 = [2 1 ; 1 2];
data2 =  [ mvnrnd(mu2,sigma2,1000) ones(1000,1)];

data3 = [data1 ; data2];
% Shuffled dataset
data4 = data3(randperm(size(data3,1)),:);

step=0.6;
stdev=0.6;

traindata = data4(1:1800,:);
testdata = data4(1801:2000,:);
p1 = zeros(200,1);
p2 = zeros(200,1);

for i = 1:200
       for k = 1:1800
           if traindata(k,3)==0
                p1(i) = p1(i) + GaussianKernel(testdata(i,1),testdata(i,2),traindata(k,1),traindata(k,2),step,stdev);
           end
           if traindata(k,3)==1
                p2(i) = p2(i) + GaussianKernel(testdata(i,1),testdata(i,2),traindata(k,1),traindata(k,2),step,stdev);
           end
       end
end

p1 = p1/(size(testdata,1) * step^2);
p2 = p2/(size(testdata,1) * step^2);




fig2 = figure;
error = 0;
for i=1 : size(testdata,1)
    if p1(i) > p2(i)
        if testdata(i,3)==0
            pl1 = plot(testdata(i,1),testdata(i,2),'b+');
            hold on
        else
            pl2 = plot(testdata(i,1),testdata(i,2),'mO');
            hold on
            error = error+1;
        end
    else
        if testdata(i,3)==1
            pl3 = plot(testdata(i,1),testdata(i,2),'rO');
            hold on
        else
            pl4 = plot(testdata(i,1),testdata(i,2),'m+');
            hold on
            error = error+1;
        end
    end
end
error
accuracy = ((size(testdata,1) - error)/size(testdata,1))*100
xlabel('X1');
ylabel('X2');
title('Classification of Test Data with Guassian Kernel');
legend([pl1,pl4,pl3,pl2] ,'Class1','Misclassified Class1','Class2','Misclassified Class2','location','Best');
%}

