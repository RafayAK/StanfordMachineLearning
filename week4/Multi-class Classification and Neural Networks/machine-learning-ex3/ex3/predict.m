function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

a_0 = [ones(m,1), X]; % add ones to the the input
a_1 = a_0*Theta1';% 5000x401 x 401x25 => 5000x25

a_1 = sigmoid(a_1); % run the sigmoid activation on values

a_1 = [ones(size(a_1,1),1), a_1]; % add bias unit 
a_2 = a_1 * Theta2';% 5000x26 x 26x10 => 5000x10

outputs = sigmoid(a_2); % run the sigmoid activation on values

[~, p] = max(outputs, [], 2);








% =========================================================================


end
