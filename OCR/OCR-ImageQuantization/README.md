OPTICAL CHARACTER RECOGNITION (OCR)

**************************************************************************************
Image Compression using Streaming KMeans -
**************************************************************************************

Data: 28x28 dimensional mnist.mat dataset

Model: A “streaming” algorithm for k-means clustering, to obtain k representatives for the training image patches, for k ∈ {8, 16, 32, 64}

Reason: Requires only a single pass through the data

Output:
Side-by-side comparisons for test images 24, 100, and 5000 (for k ∈ {8, 64})
