function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


z = X*theta;
g = zeros(size(z));
g =1./(ones(size(z))+exp(-z));
b= zeros(size(theta));
c= size(theta,1);
for i=2:c, 
   b(i) = (lambda/2*m)*(theta(i).*theta(i));
end

J = (1/m)*((((-y)')*log(g))-(((ones(size(y))-y)')*(log((ones(size(y))-g)))))+b;
s= zeros(size(theta));
a= size(theta,1);
for i=2:a, 
   s(i) = (lambda/m)*theta(i);
end;

grad = (1/m)*(X')*(g-y)+s;



% =============================================================

end
