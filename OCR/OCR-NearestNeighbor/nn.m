function preds = hw1_nn( X,Y,test )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

display('Calculating Euclidian distance');
% EUCLIDIAN DISTANCE CALCULATION
%bsxfun(@minus, testA(1,:), testB(1,:))
[r_train, ~] = size(X)
[r_test, ~] = size(test)
distance = zeros(r_test, r_train); % 10k x 60k
for i = 1:r_train
    %display(i,'Calculating distance for train point');
    for j = 1:r_test
        %calc_matrix = bsxfun(@minus, X(i,:),test(j,:));
        calc_matrix = X(i,:)-test(j,:);
        calc_matrix = calc_matrix.^2;
        distance(j,i) = sum(calc_matrix); % test x train
    end
end
distance = sqrt(distance);
%display(distance);
size(distance);


% Generating samples for testing
n = [1000,2000,4000,8000]; % row vector
popln_size = r_train;
[~,c] = size(n);

pred1 = zeros(r_test,10); % column vectors -> testsize x 10
pred2 = zeros(r_test,10);
pred3 = zeros(r_test,10);
pred4 = zeros(r_test,10);

display('Starting with prediction');
% Prediction using sample n(1,1) and pred1
for i = 1:10
    sample_index = randi(popln_size,n(1,1),1); % column vector
    for j = 1:r_test % testsize x prediction
        min = 1000000;
        min_index = -1;
        for k = 1:n(1,1)
            if min>distance(j,sample_index(k,1))
                min = distance(j,sample_index(k,1));
                min_index = sample_index(k,1);
            end
        end
        pred1(j,i) = Y(min_index,1);
    end
end

display ('Prediction with sample size 1 done.');    

% Prediction using sample n(1,2) and pred2
for i = 1:10
    sample_index = randi(popln_size,n(1,2),1); % column vector
    for j = 1:r_test % testsize x prediction
        min = 1000000;
        min_index = -1;
        for k = 1:n(1,2)
            if min>distance(j,sample_index(k,1))
                min = distance(j,sample_index(k,1));
                min_index = sample_index(k,1);
            end
        end
        pred2(j,i) = Y(min_index,1);
    end
end

display ('Prediction with sample size 2 done.');

% Prediction using sample n(1,3) and pred3
for i = 1:10
    sample_index = randi(popln_size,n(1,3),1); % column vector
    for j = 1:r_test % testsize x prediction
        min = 1000000;
        min_index = -1;
        for k = 1:n(1,3)
            if min>distance(j,sample_index(k,1))
                min = distance(j,sample_index(k,1));
                min_index = sample_index(k,1);
            end
        end
        pred3(j,i) = Y(min_index,1);
    end
end

display ('Prediction with sample size 3 done.');

% Prediction using sample n(1,4) and pred4
for i = 1:10
    sample_index = randi(popln_size,n(1,4),1); % column vector
    for j = 1:r_test % testsize x prediction
        min = 1000000;
        min_index = -1;
        for k = 1:n(1,4)
            if min>distance(j,sample_index(k,1))
                min = distance(j,sample_index(k,1));
                min_index = sample_index(k,1);
            end
        end
        pred4(j,i) = Y(min_index,1);
    end
end

display ('Prediction with sample size 4 done.');
display ('Passing stuff to main');

preds = struct('pred1',pred1,'pred2',pred2,'pred3',pred3,'pred4',pred4);


end

