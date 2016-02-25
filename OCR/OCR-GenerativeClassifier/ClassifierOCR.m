% Training classifier
params = train1b(data,labels);

% Testing classifier
preds = test1b(params, testdata);

% Test error calculation
test_error = 0;
size(testlabels)
[r,c] = size(preds)
for i = 1:r
    if testlabels(i) ~= preds(i,1)
        test_error = test_error+1;
    end
end
test_error = test_error/r;

% Training error calculation
preds_train = hw1_test1b(params, data);
train_error = 0;
size(labels);
[r,c] = size(preds_train);
for i = 1:r
    if labels(i) ~= preds_train(i,1)
        train_error = train_error+1;
    end
end


% display errors
train_error = train_error/r;
display(test_error*100,'Test error %');
display(train_error*100,'Train error %');