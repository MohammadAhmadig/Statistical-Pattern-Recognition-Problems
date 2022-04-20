function [ classify , train_classify ] = classifier( Num_of_test,Num_of_train,dict_size,test_data,train_data,dictionary,phi,phi_y )
%CLASSIFIER Summary of this function goes here
%   Detailed explanation goes here
    classify = zeros(Num_of_test,1);
    train_classify = zeros(Num_of_train,1);
    for i = 1 : Num_of_test
        sum0=0;
        sum1=0;
        sum_train0=0;
        sum_train1=0;
        for j = 1 : dict_size
            %---- test ------
            if( sum(ismember(test_data{i},dictionary(j))) )
                sum0 = sum0 + log(phi(j,2));
                sum1 = sum1 + log(phi(j,1));
            else
                sum0 = sum0 + log(1 - phi(j,2));
                sum1 = sum1 + log(1 - phi(j,1));
            end
            %----- train ------
            if( sum(ismember(train_data{i},dictionary(j))) )
                sum_train0 = sum_train0 + log(phi(j,2));
                sum_train1 = sum_train1 + log(phi(j,1));
            else
                sum_train0 = sum_train0 + log(1 - phi(j,2));
                sum_train1 = sum_train1 + log(1 - phi(j,1));
            end
        end
        sum0 = sum0 + log(1 - phi_y);
        sum1 = sum1 + log(phi_y);
        sum_train0 = sum_train0 + log(1 - phi_y);
        sum_train1 = sum_train1 + log(phi_y);
        if(sum1 > sum0)
            classify(i) = 1;
        else
            classify(i) = 0;
        end

        if(sum_train1 > sum_train0)
            train_classify(i) = 1;
        else
            train_classify(i) = 0;
        end

    end    

end

