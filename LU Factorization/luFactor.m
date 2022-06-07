%% Flynn Nyman, Mech 105, Dr. Bechara
%% LU Decomposition Algorithm Development
% 
function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

%Checks to see if matrix is square
row_check = size(A,1);
column_check = size(A,2);
if  nargin > 1
    error('Too many matrices');
end
if row_check ~= column_check
    error('Matrix is not square');
end
[n, ~] = size(A);
L = zeros(n);
P = eye(n);
for c = 1:n-1
    [~, t] = max(abs(A(c:n, c)));
    t = t+c-1;
    if t~=c
        size(A);
        A([c, t], :) = A([t, c], :);
        P([c, t], :) = P([t, c], :);
        L([c, t], :) = L([t, c], :);
    end
    for b = c+1:n
        x = A(b,c)/A(c,c);
        A(b,:) = A(b,:) - x*A(c,:);
        L(b, c) = x;
    end
    U = A;
end
for Q = 1:n
    L(Q,Q) = 1;
end
end