function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% Finds lengths of both vectors and compares them to check for error
L = length(x); 
s = length(y);
if L~=s
    error('Arrays are not the same size');
end

% Checks that the x array is evenly spaced
space_check = x(2) - x(1);
for iter = 2:L
    test = x(iter) - x(iter-1);
    if test ~= space_check
       error('Your x array is not evenly spaced');
    end
end
% n determines number of spacings in array
n = L-1;
% r starts process of determining remainder and whether a trap rule is
% needed
r = rem(L,2);
% For single application of trap rule
if n == 1
    b = max(x);
    a = min(x);
    I = (b-a)*((y(2)-y(1)/(2*n)));
end
% If there is an even number of elements simpsons 1/3 with a trap must be
% used
if r == 0
    warning('Simpsons 1/3 rule will be used followed by a single application of the trap rule');
    i = 3;
    m = 1;
    iter = (n-1)/2;
    w = ones(1,iter);
    for p = 1:iter
        c = m:2:i;
        i = i+2;
        m = m+2;
        x_i = c(1);
        x_f = c(2);
        b = x(x_f);
        a = x(x_i);
        h = (b-a)/2;
        fx_o = y(x_i);
        fx_1 = y(x_i + 1);
        fx_2 = y(x_f);
        I_simpsons = (h/3)*(fx_o + 4*fx_1 + fx_2);
        w(p) = I_simpsons;
    end
    Z = sum(w, "all");
    % Take last two elements and perform trap rule
    b = x(L);
    a = x(n);
    fx_o = y(L);
    fx_1 = y(n);
    I_trap = (b-a)*((fx_1 + fx_o)/2);
    I = I_trap + Z;
elseif r~=0
    i = 3;
    m = 1;
    iter = n/2;
    w = ones(1,iter);
    for p = 1:iter
        c = m:2:i;
        i = i+2;
        m = m+2;
        x_i = c(1);
        x_f = c(2);
        b = x(x_f);
        a = x(x_i);
        h = (b-a)/2;
        fx_o = y(x_i);
        fx_1 = y(x_i + 1);
        fx_2 = y(x_f);
        I_simpsons = (h/3)*(fx_o + 4*fx_1 + fx_2);
        w(p) = I_simpsons;
    end
    I = sum(w, "all");
end