function centers = streaming_kmeans( data ,k )
% Obtain k representatives for the training image patches
%
% Input:
% patches of train images, each patch reshaped to a row
% k = number of clusters 
% 
% Output:
% centers of the clusters: k x 16

[r,~] = size(data);
centers = zeros(k,16);
count = ones(k,1);

for i = 1:k
   centers(i,:) = data(i,:); 
end

for i = k+1:r
    [~,j] = min(sum(bsxfun(@minus,centers,data(i,:)).^2,2));
    count(j) = count(j)+1;
    centers(j,:) = centers(j,:).*(1-(1/count(j))) + data(i,:).*(1/count(j));
    %disp(i);
end

