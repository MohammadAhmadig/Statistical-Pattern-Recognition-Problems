load('trainExtra');
load('testExtra');

m = length(y);
vocabSize = size(X,2);

phiX1 = zeros(vocabSize,1);
phiX0 = zeros(vocabSize,1);

% calculating phi for y
phiY = sum(y) / length(y);

% calculating phi for x when y = 1
for j = 1:vocabSize
    sigma = 0;
    for i = 1:m
        if( X(i,j)==1 && y(i)==1)
            sigma = sigma+1;
        end
    end
    phiX1(j) = (sigma+1) / (sum(y)+2);
end

disp('phiX1 calculated');

% calculating phi for x when y = 0
for j = 1:vocabSize
    sigma = 0;
    for i = 1:m
        if( X(i,j)==1 && y(i)==0)
            sigma = sigma+1;
        end
    end
    phiX0(j) = (sigma+1) / ((m-sum(y))+2);
end

disp('phiX0 calculated');

% calculating accuracy for test data
correctNumbers = 0;
correctY1 = 0;
correctY0 = 0;
for i=1:length(ytest)
    if( check_email(Xtest,i,phiX1,phiX0,phiY) == ytest(i) )
        correctNumbers = correctNumbers+1;
        if( ytest(i) == 1)
            correctY1 = correctY1+1;
        else
            correctY0 = correctY0+1;
        end
    end
end

disp('total accauracy for test data:');
correctNumbers/length(ytest)
disp('accuracy for class spam(y=1)');
correctY1/sum(ytest)
disp('accuracy for class spam(y=0)');
correctY0/(length(ytest)-sum(ytest))

