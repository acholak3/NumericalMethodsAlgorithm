function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% Adam Cholak
%---------------------------------------
% INPUTS
% func - the function being evaluated
% xl - the upper guess
% xu - the upper guess
% es - the desired relative error (default is 0.0001%)
% maxiter - the number of iterations desired (default is 200)
%---------------------------------------
% OUTPUTS
% root - the estimated root location
% fx - the function evaluated at the root location
% ea - the approximate relative error (%)
% iter - how many iterations were performed
%---------------------------------------

% checks if the user is using the function properly
if nargin<3
    error('You are using the function incorrectly. '); %user error
elseif nargin<4 
    es=0.000001; %sets the defaults
    maxiter=200;
elseif nargin<5
    maxiter=200; %sets the defaults
end

% this finds the root, fx, ea, and iter
fxu = func(xu); %finds the y position of the upper bound
fxl = func(xl); %finds the y position of the lower bound
iter = 0; %initiate iter
root = 0; %initiate root
ea = 1; %sets max approximate error to 1
while ea > es && iter < maxiter
    proot = root;
    iter = iter + 1; %increment iter
    root = xu-((fxu*(xl-xu))/(fxl-fxu)); %falsePosition formula
    fx = func(root); %finds the y position of the root
    if sign(fx) == sign(fxu) %checks if the y positions of root and the upper bound are the same
        xu = root; %changes the bounds
        fxu = fx;
    else
        xl = root; %changes the bounds
        fxl = fx;
    end
    ea = abs((root-proot)/root)*100; %calculates the approximate error
end

end

