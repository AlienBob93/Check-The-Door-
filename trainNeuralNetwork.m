%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
hidden_layer_size = 1000;   % 25 hidden units default
num_labels = 2;          % Just checking if the door is closed

% Load Training Data
fprintf('Loading Data...\n')

load('DoorClosedDataset.mat');
X = Img(1:800, :);  % Choose the first 800 images from the dataset
y = y(1:800);
[num_X_rows num_X_cols] = size(X);
input_layer_size  = num_X_cols;

fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
load('Rand_Init_Weights.mat');

% Unroll parameters
init_nn_params = [Theta1(:) ; Theta2(:)];

%  Check gradients by running checkNNGradients
%lambda = 3;
%checkNNGradients(lambda);

printf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 50);

%  You should also try different values of lambda
lambda = 4;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[final_nn_params, cost] = fmincg(costFunction, init_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(final_nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(final_nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% save the calculated Thetas
save DoorClosedWeightsTrained.mat Theta1 Theta2 -7

% compute the training set accuracy
pred = predict(Theta1, Theta2, X);
err = 0;
for i = 1:800
    if (pred(i) == y(i))
        err = err + 1;
    end
end
err = err/800;
fprintf('\nTraining Set Accuracy: %f\n', mean(double(err));