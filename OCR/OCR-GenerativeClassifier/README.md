OPTICAL CHARACTER RECOGNITION (OCR)

**************************************************************************************
Classifier Generic -
**************************************************************************************
Data: drawn from a distribution over R2 × {0, 1, 2} where the class prior is uniform, and the class conditional densities are bivariate Gaussians N ((0, 2), I), N ((0, 0), I), N ((2, 0), 0.25I).
Model: train1a.m trains the data (data and labels) to get a classifer, and evaluates it on the test data (testdata and testlabels) using test1a.m
Output: Train error = 14%, Test error = 15.8%


**************************************************************************************
Classifier OCR -
**************************************************************************************
Data: OCR image data set mnist.mat

Model 1: Model from Classifier Generic applied
Output 1: Train error = 90.1283%, Test error = 90.2000%
Reason: The OCR covariance matrix is not invertible. There are a lot of zeros and redundant dimen- sions. Matlab tries to invert it by calculating the 1/0 = NaN and produces warnings.The result is no predictions; all the labels are originally zeros and hence on comparison to the actual labels we appear to get approximately 90% error.

Model 2: Model with class conditional distributions as multivariate Gaussians with a fixed covariance matrix that is always equal to the identity matrix
Output: Test error = 17.9700%, Train error = 19.2017%
