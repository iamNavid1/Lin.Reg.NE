% ........................................................................

% My template Matlab codes for Linear Regression with single/multiple variables
% Algorithm: Normal Equation
% LinearRegressionNorEqn.m
% Navid Salami Pargoo
% 2020

% ........................................................................

% Clear memory 
clear;

% Load the dataset into variables X and y
data = load ('data1n.txt');
X = data(:, 1:end-1);
y = data(:, end);
m = length(y); % # of training sets
n = size(X,2); % # of features

% Print out first 10 examples from the dataset
disp('First 10 eamples from the dataset are:');
disp([X(1:10,:) y(1:10,:)]);

% ========================= 2D/3D plot of input data ==========================

if n == 1
    figure;
    plot(X, y, 'rx', 'MarkerSize', 10); % Plot the data
    xlabel('???variable???'); % Set the x-axis label
    ylabel('???output???'); % Set the y-axis label
elseif n == 2
    figure;
    scatter3(X(:,1), X(:,2), y);
    xlabel('???variable1???'); % Set the x-axis label
    ylabel('???variable2???'); % Set the y-axis label
    zlabel('???output???'); % Set the z-axis label
else
    disp('The dimension of model is greater than 3 => Not possible to be plotted on screen');
end

% ============================================================================

% Add bias intercept term to X
X = [ones(m,1) X];

% Run normal equations to calculate parameters
theta = normalEqn(X, y);

% Display normal equation's result
disp('Theta computed from normal equations are:');
disp(theta);

% Estimate (predict) the output of a certain set of inputs
x = zeros(1,n);   % Replace this matrix with the parameters of prediction
x = [1 x];
predict = x * theta;
disp('Predicted OUTPUT of the set of example x (using normal equations) is:');
disp(predict);    

% ===================== 2D/3D plot of linear fit / Cost =======================

if n == 1

    % Visualizing linear fit:
    figure;
    plot(X(:,2), y, 'rx', 'MarkerSize', 10); % Plot the data
    hold on;
    plot(X(:,2), [ones(m, 1) X(:,2)]*theta, '-'); % Plot the data
    hold off; 
    xlabel('???variable???'); % Set the x-axis label
    ylabel('???output???'); % Set the y-axis label
    
elseif n == 2
    
    % Visualizing linear fit:
    figure;
    scatter3(X(:,2), X(:,3), y);   
    hold on;
    
    % initialize z axis (outputs) to a matrix of 0's
    z = zeros(m, m);
    
    % Fill out z
    for i = 1:m
        for j = 1:m
            z(i,j) = [theta(1)+(X(i,2)*theta(2))+(X(j,3)*theta(3))];
        end
    end
    z = z';
    
    % Surface plot
    surf(X(:,2), X(:,3), z);
    legend('Training data', 'Linear regression');   
    hold off; 
    xlabel('???variable1???'); % Set the x-axis label
    ylabel('???variable2???'); % Set the y-axis label
    zlabel('???output???'); % Set the z-axis label
    
else
    disp('The dimensions of model and cost function are both greater than 3 => Not possible to be plotted on screen');
end

% ============================================================================




