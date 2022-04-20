

%---------------------Dataset 1-----------------------

data = load('parta_Train1.csv');


class1=[ data(1:400,1) data(1:400,2)];
class2=[ data(401:800,1) data(401:800,2)];



mu0 = sum(class1)/400;
mu1 = sum(class2)/400;
sigma1 = zeros(2);

for i = 1:size(class1,1)
    sigma1 = sigma1 + (class1(i,:) - mu0)'*(class1(i,:) - mu0);
end
sigma1 = sigma1/400 ;

sigma2 = zeros(2);
for i = 1:size(class2,1)
    sigma2 = sigma2 + (class2(i,:) - mu1)'*(class2(i,:) - mu1);
end
sigma2 = sigma2/400 ;


Py0 = @(x,y) (1/((2*pi) * det(sigma1)^0.5)) * exp(-0.5 * ([x y] - mu0) * inv(sigma1) * ([x y] - mu0)') * 0.5;

Py1 = @(x,y) (1/((2*pi) * det(sigma2)^0.5)) * exp(-0.5 * ([x y] - mu1) * inv(sigma2) * ([x y] - mu1)') * 0.5;


A = inv(sigma1) * (mu0 - mu1)';

B = (1/2)*mu1*inv(sigma1)*mu1' - (1/2)*mu0*inv(sigma1)*mu0' ;

Yline =  @(x,y)  [x  y]*A + B;



fig1 = figure;



plot(class1(:,1),class1(:,2),'+');
hold on
plot(class2(:,1),class2(:,2),'rO');
hold on
ezcontour(Py0,[-2,8,-6,14]);
hold on
ezcontour(Py1,[-2,8,-6,14]);grid
ezplot(Yline,[-6,14]);

xlabel('X1');
ylabel('X2');
title('Data points, Decision Boundry and PDF Contours of Dataset 1');
legend('Class1','Class2','Contour 1','Contour 2','Decision Boundry','location','Best');


fig3d = figure;
ezsurf(Py0,[-2,8,-6,14]);
hold on 
ezsurf(Py1,[-2,8,-6,14]);
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Estimated PDFs of Dataset 1');


fig2 = figure;
er = 0;
for i=1 : size(data,1)
    if BClassifier(data(i,1),data(i,2),Py0,Py1) == 1
        if data(i,3)==1
            pl1 = plot(data(i,1),data(i,2),'b+');
            hold on
        else
            pl2 = plot(data(i,1),data(i,2),'mO');
            hold on
            er = er+1;
        end
    else
        if data(i,3)==0
            pl3 = plot(data(i,1),data(i,2),'rO');
            hold on
        else
            pl4 = plot(data(i,1),data(i,2),'m+');
            hold on
            er = er+1;
        end
    end
end
pl5=ezplot(Yline,[-6,14]);

xlabel('X1');
ylabel('X2');
title('Classification of Dataset 1 Train Data');
legend([pl1,pl4,pl3,pl2,pl5] ,'Class1','Misclassified Class1','Class2','Misclassified Class2','Decision Boundry','location','Best');

accuracy = (size(data,1) - er)/size(data,1) *100

data2 = load('parta_Test1.csv');

fig3 = figure;

for i=1 : size(data2,1)
    if BClassifier(data2(i,1),data2(i,2),Py0,Py1) == 1
        if data2(i,3)==1
            pl1= plot(data2(i,1),data2(i,2),'b+');
            hold on
        else
            plot(data2(i,1),data2(i,2),'mO');
            hold on
        end
    else
        if data2(i,3)==0
            pl2 = plot(data2(i,1),data2(i,2),'rO');
            hold on
        else
            plot(data2(i,1),data2(i,2),'m+');
            hold on
        end
    end
end
xlabel('X1');
ylabel('X2');
title('Classification of Dataset 1 Test Data');
legend([pl1,pl2] ,'Class1','Class2','location','Best');
%}
%---------------------Dataset 2-----------------------

data = load('parta_Train2.csv');


class1=[ data(1:400,1) data(1:400,2)];
class2=[ data(401:800,1) data(401:800,2)];



mu0 = sum(class1)/400;
mu1 = sum(class2)/400;
sigma1 = zeros(2);

for i = 1:size(class1,1)
    sigma1 = sigma1 + (class1(i,:) - mu0)'*(class1(i,:) - mu0);
end
sigma1 = sigma1/400 ;

sigma2 = zeros(2);
for i = 1:size(class2,1)
    sigma2 = sigma2 + (class2(i,:) - mu1)'*(class2(i,:) - mu1);
end
sigma2 = sigma2/400 ;


Py0 = @(x,y) (1/((2*pi) * det(sigma1)^0.5)) * exp(-0.5 * ([x y] - mu0) * inv(sigma1) * ([x y] - mu0)') * 0.5;

Py1 = @(x,y) (1/((2*pi) * det(sigma2)^0.5)) * exp(-0.5 * ([x y] - mu1) * inv(sigma2) * ([x y] - mu1)') * 0.5;


A = (-0.5) * (inv(sigma1)-inv(sigma2));

B =  ( inv(sigma1)*mu0' - inv(sigma2)*mu1') ;

C = (-0.5)* ( log(det(inv(sigma1))/det(inv(sigma2)))  +  mu0*inv(sigma1)*mu0' - mu1*inv(sigma2)*mu1') ;

Yline =  @(x,y)  [x  y]*A*[x  y]' + [x  y]*B + C -1;



fig1 = figure;



plot(class1(:,1),class1(:,2),'+');
hold on
plot(class2(:,1),class2(:,2),'rO');
hold on

ezcontour(Py0,[-4,7,-4,7]);
hold on
ezcontour(Py1,[-4,7,-4,7]);grid

ezplot(Yline);


xlabel('X1');
ylabel('X2');
title('Data points, Decision Boundry and PDF Contours of Dataset 2');
legend('Class1','Class2','Contour 1','Contour 2','Decision Boundry','location','Best');

fig3d = figure;
ezsurf(Py0,[-4,7,-4,7]);
hold on 
ezsurf(Py1,[-4,7,-4,7]);
xlabel('X1');
ylabel('X2');
zlabel('P(X)');
title('Estimated PDFs of Dataset 2');


figg = figure;
er = 0;
for i=1 : size(data,1)
    if BClassifier(data(i,1),data(i,2),Py0,Py1) == 1
        if data(i,3)==1
            ll1 = plot(data(i,1),data(i,2),'b+');
            hold on
        else
            ll4 = plot(data(i,1),data(i,2),'mO');
            hold on
            er = er +1;
        end
    else
        if data(i,3)==0
            ll2 = plot(data(i,1),data(i,2),'rO');
            hold on
        else
            ll3 = plot(data(i,1),data(i,2),'m+');
            hold on
            er = er +1;
        end
    end
end
pl5 = ezplot(Yline,[-6,14]);

xlabel('X1');
ylabel('X2');
title('Classification of Dataset 2 Train Data');
legend([ll1,ll2,ll4,pl5], 'Class1','Class2','Misclassified Class2','Decision Boundry');

accuracy = (size(data,1) - er)/size(data,1) *100



data2 = load('parta_Test2.csv');

fig3 = figure;

for i=1 : size(data2,1)
    if BClassifier(data2(i,1),data2(i,2),Py0,Py1) == 1
        if data2(i,3)==1
            pl1 = plot(data2(i,1),data2(i,2),'b+');
            hold on
        else
            plot(data2(i,1),data2(i,2),'mO');
            hold on
        end
    else
        if data2(i,3)==0
            pl2 = plot(data2(i,1),data2(i,2),'rO');
            hold on
        else
            plot(data2(i,1),data2(i,2),'m+');
            hold on
        end
    end
end
xlabel('X1');
ylabel('X2');
title('Classification of Dataset 2 Test Data');
legend([pl1,pl2] ,'Class1','Class2','location','Best');
