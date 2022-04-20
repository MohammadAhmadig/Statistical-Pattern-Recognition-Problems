function [ Teta ] = Logistic2class( step , Teta , X , Y )
%B_G_D Summary of this function goes here
%   Detailed explanation goes here

    Hteta = logsig(X * Teta);
    
    
    jump = (step * (( Y -  (Hteta) )' * X))';
         
    
    Teta = Teta + jump;
        
    

end
