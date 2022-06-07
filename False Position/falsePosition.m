%% Flynn Nyman Mech 105
% Homework 11 Algorithm Development
function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 200;
end
sign_check = func(xl)*func(xu);
if sign_check > 0
    error('Root is not in between these two points');
end
    ea = abs((xu - xl)/xu)*100;
    iter = 0;
    x_new_r = 1;
   %xr here using the inputs of xl and xu
   xr = xl - (func(xl)*(xl-xu)/(func(xl)-func(xu)));
% Loop for iterations
while ea > es && iter < maxit
    iter = iter + 1;
    x_old_r = xr;
    xr = xu - (func(xu)*(xu-xl)/(func(xu)-func(xl)));
    test = func(xl)*func(xr);
    if  test > 0
        ea = abs((xr - xl)/xr)*100;
        xl = xr;
    else
        ea = abs((xr - xu)/xr)*100;
        xu = xr;
    end
end
x_new_r = xr;
root = x_new_r;
fx = func(x_new_r);
end