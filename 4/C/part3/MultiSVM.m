function [ SVMModel ] = MultiSVM( data,i,c,sigma )
    X = data(data(:,19) == i,:);
    other = data(data(:,19) ~= i,:);

    yX = i*ones(size(X,1),1);
    yOther = -1*ones(size(other,1),1);

    X = [X ; other];
    y = [yX ; yOther];

    SVMModel = fitcsvm(X(:,1:18),y,'KernelFunction','rbf','KernelScale',sigma ...
        ,'Standardize',true,'ClassNames',[i,-1],'BoxConstraint',c);
end

