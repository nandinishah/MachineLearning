function preds = test1a( params, test )

%   Detailed explanation goes here
    prior = params.prior;
    mean = params.mean;
    covariance = params.covariance;
    [n,~] = size(test);
%     preds = zeros(n);
    preds = zeros(1,n);
    labelsize = size(prior); 
    display(labelsize(2));
    
    display('In test1a.');
%     [msgStr,msgId] = lastwarn;
%     warnStruct = warning('off',msgId);

    for i = 1:n
        display(i,'Predicting for');
        maxim = -1000000;
        for j = 1:10
           temp = test(i,:)-mean(j,:);
           inverse = inv(covariance(:,:,j));   
           product = (-0.5*(temp * inverse * temp.'));  
           factor = prior(j)*(1/sqrt(det(covariance(:,:,j))));
           answ = factor*exp(product);
           if answ>maxim
               maxim = answ;
               preds(1,i) = j-1;
           end
        end
    end
    display(preds);
    
%     warning(warnStruct);
end

