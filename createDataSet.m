%% Initialization
clear ; close all; clc

% neural network consists of a single hidden layer

hidden_layer_size = 1000;   % 1000 hidden units in the 1st layer
num_labels = 2; % 2 different labels (Closed/Opened)

%% Create the Dataset

% get all png files from the directory
fnames = dir('./Training Images/*.png');
num_examples = length(fnames); % number of examples in the dataset (1300)

for k = 1:length(fnames)
    fname = strcat('Training Images/', fnames(k).name);

    % store images in an array
    tmp = imread(fname);
    tmp = double (tmp);
    Img(k, :, :) = tmp;

    % annotate the image (Outputs)
    if (strfind(fnames(k).name, 'DC'))
        y(k) = 1;   % Door is Closed
    else
        y(k) = 2;   % Door is Opened
    end
end

% reshape the dataset so that each example is row vector
Img = reshape(Img, num_examples, []);

% Randomize the dataset order
shuffled_Indices = randperm(num_examples);
Img = Img(shuffled_Indices, :);
y = y(shuffled_Indices);
y = y(:);   % reshape into column vector

% save the variables Img and y
save DoorClosedDataset.mat Img y

%% randomly initialize the weights

% initialize epsilon
INIT_EPSILON = 0.0001;
[m n] = size(Img);

Theta1 = rand(hidden_layer_size, n + 1) * (2 * INIT_EPSILON) - INIT_EPSILON;
Theta2 = rand(num_labels, hidden_layer_size + 1) * (2 * INIT_EPSILON) - INIT_EPSILON;

% save Theta1 and Theta2
save Rand_Init_Weights.mat Theta1 Theta2;