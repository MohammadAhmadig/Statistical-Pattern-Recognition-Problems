function [ u,mu ] = kmeans( x, k, range)
    [m,n] = size(x);
    
    mu = zeros(k,n);
    randomIndexes = randi(range,m,1);
    for i = 1:k
        mu(i,:) = x(randomIndexes(i),:);
    end

    for j = 1:100
        % updating membership matrix u        
        u = zeros(m,k);
        for i = 1:m
            d = zeros(k,1);
            for ik = 1:k
                d(ik) = (x(i,:)-mu(ik,:))*(x(i,:)-mu(ik,:))';
            end
            [~,minIndex] = min(d);
            u(i,minIndex) = 1;
        end
    
        % updating mus
        count = sum(u);
    
        for ik = 1:k
            if(count(ik) ~= 0)
                mu(ik,:) = (x'*u(:,ik)) / count(ik);
            end
        end                                
    end

end

