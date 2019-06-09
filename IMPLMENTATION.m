% clear memory and the screen 
clear; close all; clc;

% first step read the training data from the text file 
%data = load('ex0.txt');
%data = load('ex1.txt');
%data = load('linear_test.txt');  %to check linear regression validiation 
%data = load('DATA_SET.txt'); % needes 2300 iterations 
%data = data /250 ; % normalize data set 
data = load('examples.txt');     %this file hase multi fea without ones  so we shold add ones to x if use it 

% initialize Matrices and Variables
X = data(:,1);     % featue matrix {" first colume "}
y = data(:, 3);     % results matrix { " second column
m = length(y);      % number of training examples 
theta = [3;7];     % initial theta vector 
start_theta=theta;  % used for the first point in the div vector
iterations = 9;  % Iterations number needed for Gradient Descent
alpha = 0.01;       % Learning Rate to go quicly
 
%______________________________________________________________
% Plot the Data as a single points on the graph 
plot(X(:,1), y, 'mx', 'MarkerSize', 7);
title('Training Examples');
xlabel('Featues " the area per 30 m ^2 "');
ylabel('Price in  10,000 $');
%______________________________________________________________


% Compute the Error by calling the Cost Function  
X = [ones(m, 1), data(:,1)]; % this Step to adding ones to X Which means X0 is a vector of 1 
J =ComputeCost (X,y,theta);

% Run Gradient Descent
[theta, Js,theta_s0,theta_s1 ] = GradientDescent(X, y, theta, alpha, iterations);
figure(1);
hold on;
plot(X(:, 2), X * theta, 'b','MarkerSize', 100);
legend('DATA SET ', 'Linear regression');
hold off;

%______________________________________________________________
% plotting the cost function
figure(2);
plot(1: iterations, Js, '-c');
title('The history of J VS Iterations');
hold on 
plot (iterations,Js(iterations),'rx');
hold on 
plot (iterations,Js(iterations),'rx');
legend ('THE ERROR','Last ERROR ') ; 
xlabel('Number Of Iterations');
ylabel('The Cost Function " J " ');
%______________________________________________________________
 

% Grid over which we will calculate J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-10, 10, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = ComputeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';


theta_s0=[start_theta(1);theta_s0] ;
theta_s1=[start_theta(2);theta_s1] ;

% Surface plot
figure(3);
title('The Surface of The ERROR');
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0');
ylabel('\theta_1');
hold on;
plot(start_theta(1), start_theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
hold on
plot(theta_s0,theta_s1,'g', 'MarkerSize', 10, 'LineWidth', 2);
hold on
plot(theta(1), theta(2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
legend('_-_-_','Starting Point','Diff Vector','Final theta') ;

%_______________________________________________________________________
% Contour plot
figure(4);
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
title('THETA0 AND THETA1 CONTOUR');
xlabel('\theta_0');
ylabel('\theta_1');
hold on;
plot(start_theta(1), start_theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
hold on
plot(theta_s0,theta_s1,'g', 'MarkerSize', 10, 'LineWidth', 2);
hold on
plot(theta(1), theta(2), 'ro', 'MarkerSize', 10, 'LineWidth', 2);

hold on;
 plot(theta_s0,theta_s1,'k*', 'MarkerSize', 5);
legend('THE Highest Points ','Starting Point','Diff Vector','Final theta','Theta values while converge') ;
