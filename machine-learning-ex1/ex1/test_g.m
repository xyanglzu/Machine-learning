function [theta] = test_g()
%TEST_G 此处显示有关此函数的摘要
%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);
[X, mu, sigma] = featureNormalize(X);
X = [ones(m, 1) X];

%% gradient descent
alpha = 0.01;
num_iters = 10000;

% Init Theta and Run Gradient Descent 
theta = [-10;-10;-10];
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

fprintf('cost function:%f\n', J_history(length(J_history)));
plot(1:numel(J_history), J_history, '-r', 'LineWidth', 2);

normalX1 = (1650 - mu(1,1)) / sigma(1,1);
normalX2 = (3 - mu(1,2)) / sigma(1,2);
price = [1, normalX1, normalX2] * theta; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

end

