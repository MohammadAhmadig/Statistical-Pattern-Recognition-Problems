function [ Yvector ] = Batch_Weighted( X , Y ,Teta ,step ,  iteration )
%BATCH_WEIGHTED Summary of this function goes here
%   Detailed explanation goes here
    Yvector = ones(size(X,1),1);
    for i=1:size(X,1)
        Xnew = X(i,2);
        Xresult = X(:,2)-Xnew;
        W = exp(-((Xresult).^2)/2);
        Wd=diag(W);
        for j=1:iteration
            jump = (step * (( Wd * (X * Teta - Y ))' * X))';
            Teta = Teta - jump;  
        end
        Ynew = [1 Xnew] * Teta;
        Yvector(i) = Ynew;
    end


end

