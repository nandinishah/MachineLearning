function preds = test1b( params,test )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    prior = params.prior;   % 1x10
    mean = params.mean;     % 10x784
    covariance = params.covariance; % 784x784
    [n,~] = size(test);     % 10kx784
    preds = zeros(n,1);

    display('In test1b.');
    for i = 1:n
        %display(i,'Predicting for');
        maxim = -1000000000000;
        for j = 1:10
           temp = test(i,:)-mean(j,:);
           product = (-0.5*(temp * covariance * temp.'));
           factor = prior(j);
           ans = log(factor)+(product);
           if ans>maxim
               maxim = ans;
               preds(i,1) = j-1;
           end
        end
    end
    %display(preds);

end

