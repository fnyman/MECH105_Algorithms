%%Homework 5
%Value of first element of each row is the number of column
%Value of first element of each column is the number of row
%Every element has the value of the element to the left plus the one above
%it.
%Function must return error if user uses wrong inputs.

function [A] = specialMatrix(n,m)
A = ones(n,m);
if nargin == 2
        for k = 2:n
        A(k,1) = k;
        end
        for k = 2:m
        A(1,k) = k;
        end
        for k = 2:n
            for l = 2:m
        A(k,l) = A(k,l-1) + A(k-1,l);
            end
        end
else 
   error('Incorrect number of arguments')
end

       


    


    
    

