function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
##options = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]; % all the different options for C and sigma
##error = 10000; % variable to check if error has decreased, initally set to Large val
##iter_counter = 1; % var to count the iterations on models
##for C_temp = options
##  for sigma_temp = options
##    
##    printf("model number : %i, C: %d, sigma: %d\n",iter_counter, C_temp, sigma_temp);
##    % Train the SVM with C_temp and sigma_temp
##    model= svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp));
##    
##    %get the prdictions with this model
##    predictions = svmPredict(model, Xval);
##
##    %get error
##    var =  mean(double(predictions ~= yval)); % store error in a temporary variable   
##    
##    if var < error
##      error = var; % set new bench mark to test against
##      
##      %set new values for parameters
##      C = C_temp;
##      sigma = sigma_temp;
##      
##      printf('Best params at the moment C: %d , sigma:%d \n', C, sigma);
##    endif
##    
##    iter_counter++; % onto the next iteration
##  endfor
##endfor
##
##printf('Found best params C: %d , sigma:%d \n', C, sigma);





% =========================================================================

end
