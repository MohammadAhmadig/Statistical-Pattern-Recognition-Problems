function retval = check_email(x,index,phiX1,phiX0,phiY)
vocabSize = size(x,2);
sum = 0;
for i=1:vocabSize
    if( x(index,i) == 1 )
        sum = sum+log(phiX1(i));
    else
        sum = sum+log(1-phiX1(i));
    end
end
p1Y1 = sum+log(phiY);

sum = 0;
for i=1:vocabSize
    if( x(index,i) == 1 )
        sum = sum+log(phiX0(i));
    else
        sum = sum+log(1-phiX0(i));
    end
end
p1Y0 = sum+log(1-phiY);

result = 0;
if(p1Y1>p1Y0)
    result = 1;
else
    result = 0;
end
retval = result;
end
