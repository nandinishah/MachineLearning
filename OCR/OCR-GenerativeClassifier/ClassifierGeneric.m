% Training classifier
params = train1a(data,labels);


% Testing classifier
preds = test1a(params, testdata);

% Test error calculation
test_error = 0;
size(testlabels)
[r,c] = size(preds)
for i = 1:c
    if testlabels(i) ~= preds(1,i)
        test_error = test_error+1;
    end
end
test_error = test_error/c;


% Training error calculation
preds_train = hw1_test1a(params, data);
train_error = 0;
size(labels)
[r,c] = size(preds_train);
for i = 1:c
    if labels(i) ~= preds_train(1,i)
        train_error = train_error+1;
    end
end


% display errors
train_error = train_error/c;
display(test_error*100,'Test error %');
display(train_error*100,'Train error %');

