function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
num_of_examples = size(X,1);
num_of_centroids = size(centroids,1);

for i = 1:num_of_examples # iterate over all the examples
  
  # First set idx to the frst centroid, then check it with resoect to other
  # centroids
  # >>> NOTE: idx(i) does not caontain "norm squared" only the index of the closest
  # >>> centroid 
  temp1 = sum((X(i,:) - centroids(1,:)).^2); # norm squared of 1st centroid 
  idx(i) = 1; # 1st example set to first centroid, temporarily
  
  for j = 2: num_of_centroids  # Now check distance with rest of centroids i.e 2 onwards
    temp2 = sum((X(i,:) - centroids(j,:)).^2);
    if temp1 > temp2 # if new j'th centroid is closer set it as index
      idx(i) = j;
      temp1 = temp2;
    endif
  
  endfor
  
endfor







% =============================================================

end

