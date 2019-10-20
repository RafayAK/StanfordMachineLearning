function y = label_vector(y_vec, num_of_labels, m)
# Input: y vector with labels, num_of_labels
# NOTE y in the for -> 1 x N
# returns:  a matrix with the labels in a vector
# in the form [1 0 0 0], [0 1 0 0 ] and so on 
# for in put labels y->(1,2,3,4)


# create a matrix of zeros where each column is a label vector
y = zeros(m, num_of_labels);  

rowIter =1;
for col_iter = y_vec
    y(rowIter,col_iter) = 1; # set one in place of the og label's index
    rowIter++;
end