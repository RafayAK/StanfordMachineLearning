function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


%fprintf('size of X: %d \n', size(X));
%fprintf('size of theta: %d \n', size(theta));
predictions = X*theta;
%fprintf('size of predications: %d \n', size(predictions));

squared_errors = (predictions - y).^2; % each term in squared
m = length(y);
J = sum(squared_errors)/(2*m);

% =========================================================================

end
