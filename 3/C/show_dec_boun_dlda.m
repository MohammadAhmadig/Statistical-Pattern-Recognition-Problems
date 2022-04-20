
load('dlda_reduce_dim');

fig1=figure;
%{
x1 = -(0.4):0.007:(0.293);
x2 = -(0.7):0.0035:-(0.3535);
xx = zeros(1,2);
labels = zeros(100,100);
for i = 1:size(x1,2)
    for j = 1:size(x2,2)
        xx = [x1(i) x2(j)];
        label = KNN(rimages_train,xx);
        labels(i,j) = label;
    end
end

for i = 1:size(x1,2)
    for j = 1:size(x2,2)
        if labels(i,j) == 1 || labels(i,j) == 7 || labels(i,j) == 13 || labels(i,j) == 19 || labels(i,j) == 25
            plot(x1(i), x2(j),'+r');
            hold on;
        elseif labels(i,j) == 2 || labels(i,j) == 8 || labels(i,j) == 14 || labels(i,j) == 20 || labels(i,j) == 26
            plot(x1(i), x2(j),'+g');
            hold on;
        elseif labels(i,j) == 3 || labels(i,j) == 9 || labels(i,j) == 15 || labels(i,j) == 21 || labels(i,j) == 27   
            plot(x1(i), x2(j),'+y');
            hold on;
        elseif labels(i,j) == 4 || labels(i,j) == 10 || labels(i,j) == 16 || labels(i,j) == 22 || labels(i,j) == 28
            plot(x1(i), x2(j),'+m');  
            hold on;
        elseif labels(i,j) == 5 || labels(i,j) == 11 || labels(i,j) == 17 || labels(i,j) == 23 || labels(i,j) == 29
            plot(x1(i), x2(j),'+c');  
            hold on;
        elseif labels(i,j) == 6 || labels(i,j) == 12 || labels(i,j) == 18 || labels(i,j) == 24 || labels(i,j) == 30
            plot(x1(i), x2(j),'+k');
            hold on;
        end
    end
end
%}

for i = 1:size(images,1)
    if ceil(i/21) == 1 || ceil(i/21) == 7 || ceil(i/21) == 13 || ceil(i/21) == 19 || ceil(i/21) == 25
        plot(rimages_train(i,1),rimages_train(i,2),'*r');
        hold on;
    elseif ceil(i/21) == 2 || ceil(i/21) == 8 || ceil(i/21) == 14 || ceil(i/21) == 20 || ceil(i/21) == 26
        plot(rimages_train(i,1),rimages_train(i,2),'*g');
        hold on;
    elseif ceil(i/21) == 3 || ceil(i/21) == 9 || ceil(i/21) == 15 || ceil(i/21) == 21 || ceil(i/21) == 27   
        plot(rimages_train(i,1),rimages_train(i,2),'*y');
        hold on;
    elseif ceil(i/21) == 4 || ceil(i/21) == 10 || ceil(i/21) == 16 || ceil(i/21) == 22 || ceil(i/21) == 28
        plot(rimages_train(i,1),rimages_train(i,2),'*m');  
        hold on;
    elseif ceil(i/21) == 5 || ceil(i/21) == 11 || ceil(i/21) == 17 || ceil(i/21) == 23 || ceil(i/21) == 29
        plot(rimages_train(i,1),rimages_train(i,2),'*c');  
        hold on;
    elseif ceil(i/21) == 6 || ceil(i/21) == 12 || ceil(i/21) == 18 || ceil(i/21) == 24 || ceil(i/21) == 30
        plot(rimages_train(i,1),rimages_train(i,2),'*k');
        hold on;
    end
end