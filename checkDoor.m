%% Initialization
clear ; close all; clc

% Load the weights into variables Theta1 and Theta2
load('DoorClosedWeightsTrained.mat');

% save the calculated Thetas
save DoorModelTrained.mat Theta1 Theta2 -7

% load the dataset
%load('DoorClosedDataset.mat');
%X_Test = Img(801:1300, :); % test set
%X_Training = Img(1:800, :);    % training set

% load image to check
%fname = 'test_image.png';
%tmp = imread(fname);
%X_test = double (tmp);
%X_test = reshape(X_test, 1, []);

% compute the training set accuracy
%pred = predict(Theta1, Theta2, X_test);
%pred_test = predict(Theta1, Theta2, X_Test);
%pred_train = predict(Theta1, Theta2, X_Training);

%err_test = 0;
%err_train = 0;
%for i = 1:500
%    if (pred_test(i) == y(i+800))
%        err_test = err_test + 1;
%    end
%end
%for i = 1:800
%    if (pred_train(i) == y(i))
%        err_train = err_train + 1;
%    end
%end
%err_test = err_test/500;
%err_train = err_train/800;

%if (pred(1) == 1)
%    fprintf('\ntest Image prediction: Door is Closed\n');
%else
%    fprintf('\ntest Image prediction: Door is Opened\n');
%end
%fprintf('\ntest set Accuracy: %f\n', double(err_test));
%fprintf('\ntraining set Accuracy: %f\n', double(err_train));