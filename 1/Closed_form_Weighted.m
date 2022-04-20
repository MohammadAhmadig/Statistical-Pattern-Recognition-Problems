function [ Yvector ] = Closed_form_Weighted( X , Y )
%CLOSED_FORM_WEIGHTED Summary of this function goes here
%   Detailed explanation goes here
    Yvector = ones(size(X,1),1);
    
    for i=1:size(X,1)
        Xnew = X(i,2);
        Xresult = X(:,2)-Xnew;
        W = exp(-((Xresult).^2)/2);
        Wd=diag(W);
        Teta = (inv(X'*Wd*X))*X'*Wd*Y;
        Ynew = [1 Xnew] * Teta;
        Yvector(i) = Ynew;
    end

end

