function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

% Sort arrays in order from smallest to largest
n = length(x);
if length(x) ~= length(y)
    error('Arrays are not the same size');
end
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
% Calculate quartiles
Q_1 = sortedY(floor((n+1)/4));
Q_3 = sortedY(floor((3*n+3)/4));
IQR = Q_3 - Q_1;
upper = Q_3 + 1.5*IQR;
lower = Q_1 - 1.5*IQR;
logical_array = logical(ones(1, n));
for i = 1:n
    if sortedY(i) <= lower || sortedY(i) >= upper
       logical_array(i) = 0;
    end
end
fX = sortedX(logical_array);
fY = sortedY(logical_array);
% Find slope
n = length(fX);
sum_x = sum(fX);
sum_y = sum(fY);
sum_x2 = sum(fX.^2);
sum2_x = sum_x^2;
sum_xy = sum(fX.*fY);
slope = (n*sum_xy - (sum_x*sum_y))/(n*sum_x2 - sum2_x);
%Find intercept
x_bar = mean(fX);
y_bar = mean(fY);
a0 = y_bar - (slope*x_bar);
% Find r^2 value
for i = 1:n
    h = (fY(i) - a0 - slope*fX(i))^2;
    S_r(i) = h;
    m = (fY(i) - y_bar)^2;
    S_t(i) = m;
end
St = sum(S_t);
Sr = sum(S_r);
Rsquared = (St-Sr)/St;
intercept = a0;
end