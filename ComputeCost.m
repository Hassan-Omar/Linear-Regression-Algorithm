function J = ComputeCost (X,y,theta)
% data = load('ex1.txt');
%X = data(:,1:2);     % featue matrix {" first colume "}
% y = data(:, 3);     % results matrix { " second column
    % lengh of summation series 
    m = length(y);
    % Calculate Hypothesis Function using vectoriziation 
    h = X * theta;
    % Calculate Cost 
    J = 1 / (2 * m) * sum((h - y) .^ 2);
   
end
