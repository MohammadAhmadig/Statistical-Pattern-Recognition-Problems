function [TETA] = SGD (data , step , TETA , X , y)
    % Stochastic Gradient Descent
    for j = 1 : size(X , 1)
        jump = step * (( (TETA' * X(j,:)') - y(j) ) * X(j,:))';
         
        TETA = TETA - jump;
        
    end
    
end
