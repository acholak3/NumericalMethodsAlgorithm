function [L, U, P] = luFactor(A)
% Adam Cholak
% This script performs lu factorization
%---------------------------------------
% INPUTS
% A - coefficient matrix
%---------------------------------------
% OUTPUTS
% L - lower triangular matrix
% U - upper triangular matrix
% P - pivot matrix
%---------------------------------------

% checks if the user is using the function properly
%---------------------------------------
% checks if the number of inputs is appropriate
if nargin~=1
    error('You need to input one coefficient matrix. '); % user error
end

% makes sure the input is a square matrix
[n,m] = size(A);
if n~=m
    error('Input a square matrix. '); % user error
end
%---------------------------------------

%---------------------------------------
% LU Factorization
n=size(A); %returns the sizes of each dimension of array
L=eye(n); %returns identity matrix of size A
P=L;
U=A;
for y = 1:n
    [~, m] = max(abs(U(y:n, y))); % finds the row number with the highest absolute value
    m = m+y-1; % this is needed to find if there needs to be a pivot
    if m ~= y
        U([m,y],:) =  U([y,m], :); % changes rows m and y in U
        P([m,y],:) =  P([y,m], :); % changes rows m and y in P
        if y >= 2 % this is where the L matrix is able to pivot for any size
            L([m,y],1:y-1) =  L([y,m], 1:y-1); % changes rows m and y in columns 1:y-1 of L
        end
    end
    for x = y+1:n
        L(x, y) = U(x, y) / U(y, y); % this finds the ratio in gauss elimination
        U(x, :) =  U(x, :) - L(x, y)*U(y, :); % subtracts L*U from the next row
    end
end