function [theta, Js ,theta_s0,theta_s1] = GradientDescent(X, y, theta, alpha, iterations)
    
    m = length(y); 
    Js = zeros(iterations, 1); % this only to store the history of the cost function 
    theta_s0=zeros(iterations,1); % and this only store the his of theta
   theta_s1=zeros(iterations,1); 
  % I think this loop will be better if i use while loop and check on  the difference of (J(i) -J(i-1) )
    % but i used this fixed number of loob to control on iterations number  
    for i = 1 : iterations,
        h = X * theta; % same hypotheies function ; 
        % calculating of theta values to assignment 
        temp1 = theta(1) - (alpha * (1 / m) * sum((h - y) .* X(:, 1)));
        temp2 = theta(2) - (alpha * (1 / m) * sum((h - y) .* X(:, 2)));
       
        % now we shold update theta values 
        theta(1) = temp1;
        theta(2) = temp2;
      
        
        Js(i) = ComputeCost (X,y,theta); % calling cost function to update J
        theta_s0(i)=theta(1);
        theta_s1(i)=theta(2);
     end
end