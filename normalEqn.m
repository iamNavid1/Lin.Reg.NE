% ........................................................................

% My template Matlab codes for Linear Regression with single/multiple variables
% Algorithm: Normal Equation
% normalEqn.m
% Navid Salami Pargoo
% 2020

% ........................................................................

% normalEqn(X, y) computes the closed-form solution for linear regression
% using normal equations.

function [theta] = normalEqn(X, y)

theta = zeros(size(X, 2), 1);

theta = pinv(X'*X)*X'*y;

end
