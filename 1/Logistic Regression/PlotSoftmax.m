function [  ] = PlotSoftmax( x1,x2,phi,Teta_result )
%PLOTSOFTMAX Summary of this function goes here
%   Detailed explanation goes here
    fig5 = figure;
    
    for i = 1:size(x1,2)
        for j = 1:size(x2,2)
            for k = 1:3
                under = 1 + sum(exp([1 x1(i) x2(j)] * Teta_result));
                numerator = exp([1 x1(i) x2(j)] * Teta_result(:, k));
                phi(k) = numerator / under;
            end
            [maxCol, yEST] = max(phi);

            if yEST == 1
                pl1 = plot(x1(i), x2(j), 'b+');
                hold on;
            elseif yEST == 2
                pl2 = plot(x1(i), x2(j), 'r+');
                hold on;
            elseif yEST == 3
                pl3 = plot(x1(i), x2(j), 'y+');
                hold on;
            end

        end
    end

    xlabel('x1');
    ylabel('x2');
    title('Softmax Color Table');
    
    legend([pl1,pl2,pl3],'Class 1','Class 2','Class 3','location','Best');
    %close(fig5);

end

