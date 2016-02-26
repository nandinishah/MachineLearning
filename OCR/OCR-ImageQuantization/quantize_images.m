function image = quantize_images(images, centers)
% images = quantize_images(images, centers)
%
% Input:
% Input:
% 'images'   28 x 28 x n array  28x28 input images
% 'centers'  k x 16 matrix      4x4 patch representatives (as vectors)
%
% Output:
% 'images'   28 x 28 x n array  quantized images

r = 4;
totalcost = 0;
for t=1:size(images,3)
  for i=1:r:28
    for j=1:r:28
      [cost,c] = min(sum(bsxfun(@minus,centers,vec(images(i:i+r-1,j:j+r-1,t))').^2,2));
      images(i:i+r-1,j:j+r-1,t) = reshape(centers(c,:),r,r);
      totalcost = totalcost + cost;
    end
  end
end
image = struct('images',images,'totalcost',totalcost);

function v = vec(matrix)
% Returns the vector obtained by stacking columns of given matrix.
v = matrix(:);