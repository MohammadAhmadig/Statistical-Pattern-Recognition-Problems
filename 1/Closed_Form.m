function [ Teta ] = Closed_Form(Teta , X , Y )
    

    Teta = (inv(X'*X))*X'*Y;
    


end

