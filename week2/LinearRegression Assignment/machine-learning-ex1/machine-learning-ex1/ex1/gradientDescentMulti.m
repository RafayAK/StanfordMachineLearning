function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %


 
    predictions = X*theta;
    error = (predictions - y);
%    printf('dimensions of error: %d %d \n', size(error,1), size(error,2));
    delta = (error'*X)/m;
%    printf('dimensions of delta: %d %d \n', size(delta,1), size(delta,2));
%    printf('dimensions of theta: %d %d \n', size(theta,1), size(theta,2));
%    temp = theta - (alpha*delta)';
%    printf('dimensions of temp: %d %d \n', size(temp,1), size(temp,2));
    theta = theta - (alpha*delta)'; 
   
%    printf('dimensions of theta: %d %d \n', size(theta,1), size(theta,2));

    % ============================================================
    
    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);









    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
