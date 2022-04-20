function [ rimages,r ] = dlda( images, k, Sb, Sw,v)        
    y = v(:,1:k);
    
    Db = y' * Sb * y;
	Dbb = Db^(-0.5);
    z = y * Dbb;
    temp = z' * Sw * z;
    [u,Dw,~] = svd(temp);
    
    a = u' * z';
	Dww = Dw^(-0.5);
    r = Dww * a;
	
    rimages = r * images';    
end