
data = load('parta_1.txt');



step = 0.00000001;
iteration = 2000;
 
%-------------- Stochastic Gradient Descent parta_1-----------------

X = [ones(size(data , 1) , 1) data(:,2)];
TETA = [40;40];
 
% Train
for i = 1 : iteration
    TETA = SGD(data ,step , TETA , X , data(:,3));
end
 


fig = figure;
plot(data(:,2),data(:,3),'+');
hold on
Y = X * TETA;
plot(data(:,2),Y,'.-r');grid
xlabel('X');
ylabel('Y');
title('Stochastic Gradient Descent part.a 1');
legend('Train','Linear Regression','location','Best');



%---------- Stochastic Gradient Descent parta_1_outlier ---------------
data2 = load('parta_1_Outlier.txt');

X = [ones(size(data2 , 1) , 1) data2(:,2)];
TETA = [0;0];
 
% Train
for i = 1 : iteration
    TETA = SGD(data2 ,step , TETA , X , data2(:,3));
end
 
fig2 = figure;
plot(data2(:,2),data2(:,3),'*');
hold on

Y = X * TETA;
plot(data2(:,2),Y,'.-g');grid
xlabel('X');
ylabel('Y');
title('Stochastic Gradient Descent part.a 1 Outlier');
legend('Train','Linear Regression','location','Best');
close(fig2);

%-------------- Stochastic Gradient Descent parta_2-----------------
data6 = load('parta_2.txt');
step = 0.001;
iteration = 2000;

X = [ones(size(data6 , 1) , 1) data6(:,2) data6(:,3) ];
TETA = [0;0;0];
Y = data6(:,4);
% Train
for i = 1 : iteration
    TETA = SGD(data ,step , TETA , X , Y);
end


fig3 = figure;
plot3(X(:,2),X(:,3),Y,'+');grid
hold on


[a, b] = meshgrid([1:1:10]);
Ys = TETA(1) + TETA(2) * a + TETA(3) * b;
surf(a,b,Ys);
 
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Stochastic Gradient Descent part.a 2');
legend('Train','Linear Regression','location','Best');
 
 close(fig3)

%--------------Batch Gradian Descent parta_1-------------------------
step = 0.00000001;
iteration = 2000;

X = [ones(size(data , 1) , 1) data(:,2)];
TETA = [0;0];
 
% Train
for i = 1 : iteration
    TETA = B_G_D(step , TETA , X , data(:,3));
end
 


fig4 = figure;
plot(data(:,2),data(:,3),'+');
hold on
Y = X * TETA;
plot(data(:,2),Y,'.-r');grid
xlabel('X');
ylabel('Y');
title('Batch Gradient Descent parta 1');
legend('Train','Linear Regression','location','Best');
close(fig4);

%-------------- Batch Gradian Descent parta 1 outlier -----------------
step = 0.00000001;
iteration = 2000;

X = [ones(size(data2 , 1) , 1) data2(:,2)];
TETA = [0;0];
 
% Train
for i = 1 : iteration
    TETA = B_G_D(step , TETA , X , data2(:,3));
end
 


fig5 = figure;

plot(data2(:,2),data2(:,3),'*');
hold on

Y = X * TETA;
plot(data2(:,2),Y,'.-g');grid

xlabel('X');
ylabel('Y');
title('Batch Gradient Descent part.a 1 outlier');
legend('Train','Linear Regression','location','Best');
close(fig5);

%--------------Batch Gradian Descent parta_2-------------------------

data6 = load('parta_2.txt');
step = 0.0001;
iteration = 2000;

X = [ones(size(data6 , 1) , 1) data6(:,2) data6(:,3) ];
TETA = [0;0;0];
Y = data6(:,4);


 
% Train
for i = 1 : iteration
    TETA = B_G_D(step , TETA , X , Y);
end
 


fig6 = figure;
plot3(X(:,2),X(:,3),Y,'+');grid
hold on

[a, b] = meshgrid([1:1:10]);
Ys = TETA(1) + TETA(2) * a + TETA(3) * b;
surf(a,b,Ys);
    
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Batch Gradient Descent part.a 2');
legend('Train','Linear Regression','location','Best');
close(fig6); 



% ---------- Closed Form part.a 1------------

X = [ones(size(data , 1) , 1) data(:,2)];
TETA = [0;0];
 
% Train
TETA = Closed_Form(TETA , X , data(:,3));

fig7 = figure;
plot(data(:,2),data(:,3),'+');
hold on

Y = X * TETA;

plot(data(:,2),Y,'.-r');grid
xlabel('X');
ylabel('Y');
title('Closed Form part.a 1');
legend('Train','Linear Regression','location','Best');
close(fig7)


%-------------------closed Form part.a 1 outlier ------------------------------
X = [ones(size(data2 , 1) , 1) data2(:,2)];
TETA = [0;0];
 
% Train
TETA = Closed_Form(TETA , X , data2(:,3));

fig8 = figure;
plot(data2(:,2),data2(:,3),'+');
hold on

Y = X * TETA;

plot(data2(:,2),Y,'.-g');grid
xlabel('X');
ylabel('Y');
title('Closed Form part.a 1 outlier');
legend('Train','Linear Regression','location','Best');
close(fig8);

%-------------------closed Form part.a 2 ------------------------------
data6 = load('parta_2.txt');
step = 0.0001;
iteration = 2000;

X = [ones(size(data6 , 1) , 1) data6(:,2) data6(:,3) ];
TETA = [0;0;0];
Y = data6(:,4);

% Train
TETA = Closed_Form(TETA , X , Y);





fig9 = figure;
plot3(X(:,2),X(:,3),Y,'+');grid
hold on


[a, b] = meshgrid([1:1:10]);
Ys = TETA(1) + TETA(2) * a + TETA(3) * b;
surf(a,b,Ys);
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Closed Form part.a 2');
legend('Train','Linear Regression','location','Best');

close(fig9);



% ----------------------- J_Teta ---------------------------------------
X = [ones(size(data , 1) , 1) data(:,2)];
Y = data(:,3);
a = 0:1:49;  
b = -2.5:.1:2.4;    

js = ones(50,50);

for i=1:50
    for j=1:50
        TETA = [a(i);b(j)];
        js(i,j) = J_Teta(TETA , X , Y);
    end
end

fig10 = figure;
surf(b,a,js);
zlabel('J (TETA0,TETA1)')
xlabel('TETA1');
ylabel('TETA0');
title('J teta  parta 1');
close(fig10);

% --------------Normalized stochastic-------------------

data6 = load('parta_2.txt');
step = 0.001;
iteration = 2000;

a = data6(:,2);
a = (a - min(a))/(max(a)-min(a));

b = data6(:,3);
b = (b - min(b))/(max(b)-min(b));

X = [ones(size(data6 , 1) , 1) a b];
TETA = [0;0;0];
Y = data6(:,4);
% Train
for i = 1 : iteration
    TETA = SGD(data6 ,step , TETA , X , Y);
end


fig11 = figure;
plot3(X(:,2),X(:,3),Y,'+');grid
hold on


[a, b] = meshgrid([0:.1:1]);
Ys = TETA(1) + TETA(2) * a + TETA(3) * b;
surf(a,b,Ys);
 
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Normalized Stochastic part.a 2');
legend('Train','Linear Regression','location','Best');
close(fig11);

%-----------------------------------------------------------------------

% -------------------- Weighted Closed Form ----------------------------

data3 = load('partb_1.txt');

X = [ones(size(data3 , 1) , 1) data3(:,2)];
Y=data3(:,3);
TETA = [0;0];

W = zeros(size(X,1),1);

%Compute Weight 
oldTeta = Closed_Form(TETA , X , Y);

for i=1:size(X,1)
        
        yestimated =  X(i,:) * oldTeta   ;
        distance = abs(yestimated - Y(i,:));
        W(i) = 1/distance;
end

% Train

Wd=diag(W);
Teta =  inv(X'*Wd*X) * (X'*Wd*Y);

fig12 = figure;

plot(data3(:,2),data3(:,3),'+');
hold on

Yv = X * Teta;
Yold = X * oldTeta;

plot(data3(:,2),Yv,'.-g');grid

hold on 
plot(data3(:,2),Yold,'.-r');grid
xlabel('X');
ylabel('Y');
title('Weighted Closed form');
legend('Train','Weighted Linear regression','Linear Regression','location','Best');

close(fig12);


%------------ Weighted Batch Gradient Descent -----------------

X = [ones(size(data3 , 1) , 1) data3(:,2)];
Y=data3(:,3);
TETA = [0;0];

% Train
%Yv = Batch_Weighted( X , data3(:,3),TETA, step , iteration);
W = zeros(size(X,1),1);

%Compute Weight 
oldTeta = Closed_Form(TETA , X , Y);

for i=1:size(X,1)
        
        yestimated =  X(i,:) * oldTeta   ;
        distance = abs(yestimated - Y(i,:));
        W(i) = 1/distance;
end


Wd=diag(W);
for j=1:iteration
    jump = (step * (( Wd * (X * TETA - Y ))' * X))';
    TETA = TETA - jump;  
end




fig13 = figure;
plot(data3(:,2),data3(:,3),'+');
hold on


Yv = X * Teta;
Yold = X * oldTeta;

plot(data3(:,2),Yv,'.-g');grid

hold on 
plot(data3(:,2),Yold,'.-r');grid


%plot(data3(:,2),Yv,'rO');grid
xlabel('X');
ylabel('Y');
title('Weighted Batch');
legend('Train','Weighted Linear Regression','Linear Regression','location','Best');

%close(fig13);
