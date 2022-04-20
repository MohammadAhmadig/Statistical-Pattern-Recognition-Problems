function [ estlabels ] = NumberEstimation( data,labels,testdata )
%NUMBERESTIMATION Summary of this function goes here
%   Detailed explanation goes here

py0 = 0;
py1 = 0;
py2 = 0;
py3 = 0;
py4 = 0;
py5 = 0;
py6 = 0;
py7 = 0;
py8 = 0;
py9 = 0;
n0 = 0;
n1 = 0;
n2 = 0;
n3 = 0;
n4 = 0;
n5 = 0;
n6 = 0;
n7 = 0;
n8 = 0;
n9 = 0;


numof0 = size(labels(labels==0),1);
numof1 = size(labels(labels==1),1);
numof2 = size(labels(labels==2),1);
numof3 = size(labels(labels==3),1);
numof4 = size(labels(labels==4),1);
numof5 = size(labels(labels==5),1);
numof6 = size(labels(labels==6),1);
numof7 = size(labels(labels==7),1);
numof8 = size(labels(labels==8),1);
numof9 = size(labels(labels==9),1);


estlabels = zeros(size(testdata,2),1);

for i = 1 : size(testdata,2)
         for k = 1 : 785
             for j = 1 : size(data,2)
                if labels(j)==0
                     if testdata(k,i) == data(k,j) 
                         n0 = n0 + 1 ;   
                     end
                elseif labels(j)==1
                     if testdata(k,i) == data(k,j) 
                         n1 = n1 + 1 ;   
                     end
                elseif labels(j)==2
                     if testdata(k,i) == data(k,j) 
                         n2 = n2 + 1 ;   
                     end
                elseif labels(j)==3
                     if testdata(k,i) == data(k,j) 
                         n3 = n3 + 1 ;   
                     end
                elseif labels(j)==4
                     if testdata(k,i) == data(k,j) 
                         n4 = n4 + 1 ;   
                     end
                elseif labels(j)==5
                     if testdata(k,i) == data(k,j) 
                         n5 = n5 + 1 ;   
                     end     
                elseif labels(j)==6
                     if testdata(k,i) == data(k,j) 
                         n6 = n6 + 1 ;   
                     end
                elseif labels(j)==7
                     if testdata(k,i) == data(k,j) 
                         n7 = n7 + 1 ;   
                     end
                elseif labels(j)==8
                     if testdata(k,i) == data(k,j) 
                         n8 = n8 + 1 ;   
                     end
                elseif labels(j)==9
                     if testdata(k,i) == data(k,j) 
                         n9 = n9 + 1 ;   
                     end
                end
                
             end
             py0 = py0 + log((n0+1)/(numof0+10));
             py1 = py1 + log((n1+1)/(numof1+10));
             py2 = py2 + log((n2+1)/(numof2+10));
             py3 = py3 + log((n3+1)/(numof3+10));
             py4 = py4 + log((n4+1)/(numof4+10));
             py5 = py5 + log((n5+1)/(numof5+10));
             py6 = py6 + log((n6+1)/(numof6+10));
             py7 = py7 + log((n7+1)/(numof7+10));
             py8 = py8 + log((n8+1)/(numof8+10));
             py9 = py9 + log((n9+1)/(numof9+10));
             n0 = 0;
             n1 = 0;
             n2 = 0;
             n3 = 0;
             n4 = 0;
             n5 = 0;
             n6 = 0;
             n7 = 0;
             n8 = 0;
             n9 = 0;
       
       
        end 
        py0 = py0 + log(numof0/5000);
        py1 = py1 + log(numof1/5000);
        py2 = py2 + log(numof2/5000);
        py3 = py3 + log(numof3/5000);
        py4 = py4 + log(numof4/5000);
        py5 = py5 + log(numof5/5000);
        py6 = py6 + log(numof6/5000);
        py7 = py7 + log(numof7/5000);
        py8 = py8 + log(numof8/5000);
        py9 = py9 + log(numof9/5000);
        [p,ind] = max([py0 py1 py2 py3 py4 py5 py6 py7 py8 py9]);
        estlabels(i) = ind-1;
        py0 = 0;
        py1 = 0;
        py2 = 0;
        py3 = 0;
        py4 = 0;
        py5 = 0;
        py6 = 0;
        py7 = 0;
        py8 = 0;
        py9 = 0;
     
end


end

