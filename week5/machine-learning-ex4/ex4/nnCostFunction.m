function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


# Part 1 (a) - Forward propogation and Computation of the cost function J

y_labeled_vector = label_vector(y',num_labels,m);# 5000x10

a1 = [ones(m,1) X]; # add a column of 1s to X for the bias units, makes our 
                    # activations, a1, for layer 1

                    
                    
z2 = a1*Theta1'; # claculate the expressions to feed to the sigmoid function
a2 = sigmoid(z2); # claculate the activations for layer 2 (hidden layer)  
a2 = [ones(size(a2,1),1) a2];



# claculate the expressions to feed the sigmoid function, also adding a 
# column of ones for bias units
z3 = a2 * Theta2';
a3 = sigmoid(z3); # activations of layer 3 -> hypothesis

                                      
# cost calculatoion here                                     
a = log(a3);
b = log(1.-a3);

for (i = 1:m)# i -> 1-num_training_egs
  col_iter = 1;
  #y_labeled_vector(i,:)
  for (j = y_labeled_vector(i,:))
   # j
    J += ((-j*a(i,col_iter)) - ((1-j)*(b(i,col_iter))))/m;
    col_iter++;
  endfor

endfor

# -------------------------------------------------


# Part 1 (b) - adding regularization
 
Theta1_without_bias = [Theta1(:,2:end)];
Theta2_without_bias = [Theta2(:,2:end)];
ThetaVec = [Theta1_without_bias(:); Theta2_without_bias(:)];
J += ( (lambda/(2*m))*(sum(ThetaVec.^2)) );

#--------------------------------------------------
#--------------------------------------------------

# Part 2 - Back prop Algorithim here

# a1 -> 5000x401
# a2 -> 5000x26
# a3 -> 5000x10
   

partial3 = a3 - y_labeled_vector;
%printf("partial3: %d %d\n\n", size(partial3));
%printf("Theta2: %d %d\n\n", size(Theta2));
%printf("g'(z2): %d %d\n\n", size(sigmoidGradient(z2)));

partial2 = partial3*Theta2(:,2:end).*sigmoidGradient(z2);
%printf("partial2: %d %d\n\n", size(partial2));

delta1 = partial2'*a1;
delta2 = partial3'*a2;
%printf("delta1: %d %d\n\n", size(delta1));
%printf("delta2: %d %d\n\n", size(delta2)); 


Theta1(:,1) = 0;
Theta2(:,1) = 0;

Theta1 = (lambda/m).*Theta1;# Theta1 scaled for regularization
Theta2 = (lambda/m).*Theta2;# Theta2 scaled for regularization

Theta1_grad = delta1/m + Theta1;
Theta2_grad = delta2/m + Theta2;  

grad = [Theta1_grad(:) ; Theta2_grad(:)];














% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
