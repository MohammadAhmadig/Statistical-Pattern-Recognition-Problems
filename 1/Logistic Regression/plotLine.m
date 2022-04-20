function [  ] = plotLine( TETA1 , X , color )
%PLOTLINE Summary of this function goes here
%   Detailed explanation goes here
    
        
        Xline = [X(:,1) X(:,2)];
        TETAline =[TETA1(1,1) ; TETA1(2,1)];
        TETAline = TETAline .* (-1);
        X3 = Xline * TETAline ;
        X3 = X3/(TETA1(3,1));

        plot(X(:,2),X3,color);
        hold on
        


end

