function [ Teta ] = B_G_D( step , Teta , X , Y )

    jump = (step * (( (X * Teta) - Y )' * X))';
        
    Teta = Teta - jump;
        
    

end

