function [ phi ] = phi_i(dict_size , Num_of_nospam,Num_of_spam,Num_of_train,train_data,dictionary)
%PHI_I Summary of this function goes here
%   Detailed explanation goes here
    phi = zeros(dict_size,2);
    Num_of_class = 2;
    for i = 1 : dict_size
        counter=0;
        %--------- for phi_i_y=1 -------
        for j = 1 : Num_of_nospam
            counter = counter + sum(ismember(train_data{j},dictionary(i)));
        end
        phi(i,1)= counter+1;% +1 ==> laplace smoothing
        %i
        %--------- for phi_i_y=0 -------
        counter=0;
        for j = (Num_of_nospam+1) : Num_of_train
            counter = counter + sum(ismember(train_data{j},dictionary(i)));
        end
        phi(i,2)= counter+1;% +1 ==> laplace smoothing
    end
    phi = [phi(:,1)/(Num_of_nospam + Num_of_class) phi(:,2)/(Num_of_spam + Num_of_class)]

end

