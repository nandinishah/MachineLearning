% IMAGE QUANTIZATION USING K-MEANS

% Calculate the k centers using streaming k-means algorithm
disp('Calculating centers for k = 8');
centersk8 = streaming_kmeans(patches,8);
disp('Calculating centers for k = 16');
centersk16 = streaming_kmeans(patches, 16);
disp('Calculating centers for k = 32');
centersk32 = streaming_kmeans(patches, 32);
disp('Calculating centers for k = 64');
centersk64 = streaming_kmeans(patches, 64);

% Quantizing the test images
disp('Quantizing for k = 8');
quantizedimagek8 = quantize_images(testdata, centersk8);
disp('Quantizing for k = 16');
quantizedimagek16 = quantize_images(testdata, centersk16);
disp('Quantizing for k = 32');
quantizedimagek32 = quantize_images(testdata, centersk32);
disp('Quantizing for k = 64');
quantizedimagek64 = quantize_images(testdata, centersk64);
 
% Plotting cost versus log2k
costk = zeros(1,4);
costk(1,1) = quantizedimagek8.totalcost;
costk(1,2) = quantizedimagek16.totalcost;
costk(1,3) = quantizedimagek32.totalcost;
costk(1,4) = quantizedimagek64.totalcost;
K = [log2(8),log2(16),log2(32),log2(64)];
plot(K, costk);
 
% Comparing reconstructed elements original data with quantized image k = 8 and 64
qimagek8 = quantizedimagek8.images;
qimagek64 = quantizedimagek64.images;
imagesc([testdata(:,:,24),qimagek8(:,:,24),qimagek64(:,:,24)]);
imagesc([testdata(:,:,100),qimagek8(:,:,100),qimagek64(:,:,100)]);
imagesc([testdata(:,:,5000),qimagek8(:,:,5000),qimagek64(:,:,5000)]);
 
save('workspace');
