
data = load('iris1.data');
step = 0.01;
iteration = 10000;
 


X = [ones(size(data , 1) , 1) data(:,3) data(:,4)];
Y = data(:,5);


TETA = [0;0;0];

JTeta = zeros(iteration, 1);

% Train
for i = 1 : iteration
    
    TETA = Logistic2class(step , TETA , X , Y);
    Hteta = logsig(X * TETA);
    Jtemp = 1;
    for j=1: size(X,1)
        if Y(j)==1 
            mult = Hteta(j);
        else
            mult =  1 - Hteta(j);
        end
        
        Jtemp = mult * Jtemp ;
        
    end
    JTeta(i,1) = Jtemp;
    
end

figJ = figure;
iterationnum = 1:10000;

plot(iterationnum',JTeta,'.g');
hold on
xlabel('Iteration');
ylabel('Obj Fun value');
title('Objective Function');

close(figJ);

fig1 = figure;

hold on
plot(X(1:50,2),X(1:50,3),'+');
hold on
plot(X(51:100,2),X(51:100,3),'rO');grid
hold on 
plotLine(TETA, X,'.-g');
xlabel('X1');
ylabel('X2');
title('Two Class Logistic Regression');
legend('Class 1','Class 2','location','Best');
close(fig1);
%------------------Color plain----------------------
Xflat1 = 0:0.1:3.5;
Xflat2 = 3:0.1:7;

fig2 = figure;

for i=1:size(Xflat1,2)
    for j=1:size(Xflat2,2) 
        Ye = TETA(1,1) + Xflat1(i) * TETA(3,1) + Xflat2(j) * TETA(2,1);
        if Ye<=0
            plot(Xflat2(j),Xflat1(i),'xb');
            hold on;
        else
            plot(Xflat2(j),Xflat1(i),'xr');
            hold on;
        end
    end
    
end 
xlabel('X1');
ylabel('X2');
title('Two Class Logistic Regression Color');




close(fig2)



 %--------------One Vs One---------------------
 
data = load('iris2.data');
step = 0.1;
iteration = 10000;
 


X = [ones(size(data , 1) , 1) data(:,3) data(:,4)];
Y = [zeros(50,1) ; ones(50,1)]  ;



TETA1 = [0;0;0];
TETA2 = [0;0;0];
TETA3 = [0;0;0];
 
 for i = 1 : iteration
    TETA1 = Logistic2class(step , TETA1 , X(1:100,:) , Y);
 end
 for i = 1 : iteration
    TETA2 = Logistic2class(step , TETA2 , X(51:150,:) , Y);
 end
  for i = 1 : iteration
    TETA3 = Logistic2class(step , TETA3 , [X(1:50,:) ;X(101:150,:)]  , Y);
 end
 
 
fig3 = figure;
plot(X(1:50,2),X(1:50,3),'+');
hold on
plot(X(51:100,2),X(51:100,3),'rO');grid
hold on
plot(X(101:150,2),X(101:150,3),'y*');
hold on



plotLine(TETA1, X(1:100,:),'.-g');

plotLine(TETA2, X(50:150,:),'.-b');

plotLine(TETA3,[X(1:50,:) ;X(100:150,:)],'.-r');

xlabel('X1');
ylabel('X2');
title('One vs. One');
legend('Class 1','Class 2','Class3','1-2 Line','2-3 Line','1-3 Line','location','Best');


close(fig3);

%------------------One Vs All ----------------------

step = 0.01;

iteration = 2000;

X = [ones(size(data , 1) , 1) data(:,3) data(:,4)];
Y1 = [ones(50,1) ; zeros(100,1)  ]  ;
Y2 = [ zeros(100,1) ; ones(50,1) ]  ;
Y3 = [ zeros(50,1) ; ones(50,1) ; zeros(50,1) ]  ;

TETA1 = [0;0;0];
TETA2 = [0;0;0];
TETA3 = [0;0;0];
 
 for i = 1 : iteration
    TETA1 = Logistic2class(step , TETA1 , X(:,:) , Y1);
 end
 for i = 1 : iteration
    TETA2 = Logistic2class(step , TETA2 , X(:,:) , Y2);
 end
  for i = 1 : iteration
    TETA3 = Logistic2class(step , TETA3 , X(:,:) , Y3);
 end
 
 
fig4 = figure;
plot(X(1:50,2),X(1:50,3),'+');
hold on
plot(X(51:100,2),X(51:100,3),'rO');grid
hold on
plot(X(101:150,2),X(101:150,3),'y*');
hold on



plotLine(TETA1, X(:,:),'.-g');

plotLine(TETA2, X(:,:),'.-b');

plotLine(TETA3,X(:,:) ,'.-r');


xlabel('X1');
ylabel('X2');
title('One vs. All');
legend('Class 1','Class 2','Class 3','1 vs. all','3 vs. all ','2 vs. all','location','Best');

%close(fig4);


%----------------------Softmax-------------------------
data = load('iris2.data');

step = 2.9;
iteration = 450;

X = [ones(size(data , 1) , 1) data(:,3) data(:,4)];
Y = data(:,5)  ;

Teta_result = Softmax( step , iteration , X , Y );

% Softmax color table
phi = [0;0;0];
x1 = 0:0.12:7;
x2 = -3:0.12:4;
PlotSoftmax(x1,x2,phi,Teta_result);





 