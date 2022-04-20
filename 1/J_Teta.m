
function [ JTeta ] = J_Teta(Teta , X , Y )
%CLOSED_FORM Summary of this function goes here
%   Detailed explanation goes here
    JTeta = (1/2)*(X*Teta - Y)'*(X*Teta - Y) ;
    


end
