x = [rand(50,3); rand(50,3)+2;rand(50,3)+4];

m = size(x,1);
n = size(x,2);
k = 3;
range = 4;
mu = rand(k,n)*range;

for j = 1:100
    % updating membership matrix u        
    u = zeros(m,k);
    for i = 1:m
        d = zeros(k,1);
        for ik = 1:k
            d(ik) = (x(i,:)-mu(ik,:))*(x(i,:)-mu(ik,:))';
        end
        [minVal,minIndex] = min(d);
        u(i,minIndex) = 1;
    end
    
    % updating mus
    count = sum(u);
    
    for ik = 1:k
        mu(ik,:) = (x'*u(:,ik)) / count(ik);
    end                                
end

plot3(x(:,1),x(:,2),x(:,3),'.');
hold on;
plot3(mu(:,1),mu(:,2),mu(:,3),'*');

