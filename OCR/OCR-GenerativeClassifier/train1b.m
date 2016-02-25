function params = train1b ( X,Y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[n,d] = size(X);

% labels = [0,1,2,3,4,5,6,7,8,9];
prior = zeros(1,10);

for i = 1:n
    prior(1,Y(i)+1)=prior(1,Y(i)+1)+1;
end
prior = prior/n;

% MEAN CALCULATION
display('Doing mean calculation.');
mean = zeros(10,d); % each mean = (1x784)
for i = 1:n
    mean(Y(i)+1,:) = mean(Y(i)+1,:) + X(i,:);
end
for i = 1:10
    mean(i,:) = mean(i,:)/(prior(1,i)*n);
end
%display(mean(6,:));

display('Doing cov calculation.');
% COVARIANCE CALCULATION
covariance = eye(d);

display('Done and returning params in training.');
params = struct('prior', prior, 'mean', mean, 'covariance',covariance);

end

