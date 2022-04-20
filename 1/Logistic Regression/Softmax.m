function [ Teta ] = Softmax(step , iteration , X , y )

    Teta = ones(3);
    for i = 1:iteration
        result = ones(3);
        for j = 1:3
            % make 1(y(i)= j)
            classes = zeros(size(y,1), 1);
            for k = 1:size(y)
                if(y(k) == j)
                    classes(k) = 1;
                end
            end
            % probability( y(i)=j | x(i);Teta)
            probability = zeros(size(X, 1) ,1);
            for L = 1:size(X, 1)
                numerator = exp(X(L, :) * Teta(:, j));% exp(x1 * Teta1)
                under = sum(exp(X(L, :) * Teta));% sum(exp(x1 * Teta))

                probability(L) = numerator / under;
            end
            % deltaJ and gradian ascent
            sigma = sum(X .* ((classes - probability) * ones(1, size(X, 2))));
            deltaJ = (1/(size(X, 1))) * sigma;

            result(:, j) = Teta(:, j) + step * (deltaJ)';

        end
        Teta = result;
    end
        
end

