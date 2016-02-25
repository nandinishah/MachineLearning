function params = train1a(X,Y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[n,d] = size(X);
% labels = [0,1,2,3,4,5,6,7,8,9];
prior = zeros(1,10);

for i = 1:n
    prior(Y(i)+1)=prior(Y(i)+1)+1;
end
prior = prior/n;
%display(prior);
%display(sum(prior));

% MEAN CALCULATION
display('Doing mean calculation.');
mean = zeros(10,d); % each mean = (1x784)
%display(X(1,:));
for i = 1:n
    mean(Y(i)+1,:)= mean(Y(i)+1,:) + X(i,:);
end
mean = mean/n;
for i = 1:10
    mean(i,:) = mean(i,:)/prior(i);
end
display(mean);

display('Doing cov calculation.');
% COVARIANCE CALCULATION
covariance = zeros(d,d,10);
for i = 1:n
    %temp = zeros(d,d);
    temp = X(i,:) - mean(Y(i)+1,:);
    temp = temp.'*temp;
%     display(temp);
%     display(size(temp));
    temp = permute(reshape(temp,d,d,1), [1 2 3]);
    %display(size(temp));
    %display(size(covariance));
    covariance(:,:,Y(i)+1) = covariance(:,:,Y(i)+1) + temp; %temp(:,:,1);
end
%size(testing)
%testing = cov(testing,testing)
%size(testing)
%covariance = covariance/n;

for i = 1:10
    covariance(:,:,i) = covariance(:,:,i)/(prior(i)*n);    
end
display(covariance(:,:,:));

display('Done and returning params in training.');
params = struct('prior', prior, 'mean', mean, 'covariance',covariance);
%params.prior

end

