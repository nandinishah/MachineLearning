% For each value of n in {1000, 2000, 4000, 8000}:
%   For repetition = 1 to 10:
%     Draw n random points from 'data' (with corresponding labels).
%     Use these n points as training data in a NN classifier.
%     Make predictions on the test data and compute the test error.
%   Record the mean and stddev of test errors across the 10 repetitions.

preds = nn(data,labels,testdata);
pred1 = preds.pred1;
pred2 = preds.pred2;
pred3 = preds.pred3;
pred4 = preds.pred4;
[r_test,~] = size(testlabels);


% Error calculation
display('Error calculation');
%display(pred1);
err = zeros(4,10);
for i = 1:10
    for j = 1:r_test
        if pred1(j,i) ~= testlabels(j,1)
           err(1,i) = err(1,i)+1;
        end
        if pred2(j,i) ~= testlabels(j,1)
           err(2,i) = err(2,i)+1;
        end
        if pred3(j,i) ~= testlabels(j,1)
           err(3,i) = err(3,i)+1;
        end
        if pred4(j,i) ~= testlabels(j,1)
           err(4,i) = err(4,i)+1;
        end
    end
end

err = err./10000;
display(err*100,'error%');
mean_err = sum(err,2)./10;
display(mean_err*100, 'mean error %');
std = zeros(4,1);
std(1,1) = std2(err(1,:));
std(2,1) = std2(err(2,:));
std(3,1) = std2(err(3,:));
std(4,1) = std2(err(4,:));
display(std,'standard dev');

x = [1000,2000,4000,8000];

% PLOTTING THE CURVE
%plot(x,mean_err)
errorbar(x,mean_err,std)
title('LEARNING CURVE')
xlabel('sample size')
ylabel('error')

