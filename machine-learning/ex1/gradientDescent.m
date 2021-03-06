function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    fprintf('cost: %d ', computeCost(X, y, theta));
    fprintf('theta0: %f ', theta(1));
    fprintf('theta1: %f\n', theta(2));
    
    x = X(:,2);
    h = theta(1) +  theta(2) * x;
    
    deriv0 = sum(h - y)/m;
    deriv1 = sum((h - y) .* x)/m;
    
    theta(1) = theta(1) - alpha * deriv0;
    theta(2) = theta(2) - alpha * deriv1;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
