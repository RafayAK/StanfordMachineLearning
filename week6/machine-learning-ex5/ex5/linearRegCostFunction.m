function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


%printf('\n\nsize of X: %d %d\n\n', size(X,1), size(X, 2));
%printf('\n\nsize of Theta: %d %d\n\n', size(theta,1), size(theta, 2));
hypothesis =  X * theta;
error_in_hypothesis = hypothesis - y;

% Without regulariation
J = sum(error_in_hypothesis.^2) /(2*m);

%added regulariation
theta_without_bias = theta; % first term is bias unit
theta_without_bias(1,:) =0;
J += (sum(theta_without_bias.^2))*(lambda/(2*m));

% grad caclculated here without 
grad = (X'*error_in_hypothesis)./m;

% added regulariation term in gradient
grad+= theta_without_bias.*(lambda/m);








% =========================================================================

grad = grad(:);

end
