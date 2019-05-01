function I = Simpson(x,y)
% Adam Cholak
% This script performs 1/3 Simpson's rule and trapezoidal rule
% if necessary.
%---------------------------------------
% INPUTS
% x - x array
% y - y array
%---------------------------------------
% OUTPUTS
% I = summation of intervals
%---------------------------------------

% checks if the user is using the function properly

if nargin < 2 %input arguments must equal 2
    error('wrong number of inputs');
end

if length(x) ~= length(y) %lengths of both x and y must be the same
    error('number of x inputs does not equal number of y inputs');
end

a = linspace(x(1),x(length(x)),length(x)); %makes x into an evenly space array with its initial and final value
b = isequal(a,x); %b is set to 1 or 0 based on whether a=b
if abs(a-x) < eps %because of subtraction cancellation error
    b = 1; %set b to true
end
if b == 0 %if b is false the spacing is uneven
    error('The spacing is uneven')
end

%---------------------------------------
lus=mod(length(x),2); %determines how many x-values are inputed in the array using modulus
I=0; %initializes I (integral)
if length(x)>=3 %1/3 simpson's rule should be used when the length of x is greater than or equal to 3
    for i=1:floor((length(x)-1)/2) %finds the end criteria
        I = I + ((x(2*i+1)-x(2*i-1))*(y(2*i-1)+4*y(2*i)+y(2*i+1)))/6; %uses the first 3 inputs for a 1/3 simpson rule and loops when necessary
    end
end

if lus==0 %when the input array has an even length trapezoidal rule must be applied
    trap = (x(length(x))-x(length(x)-1))*(y(length(x)-1)+y(length(x)))/2; %trapezoidal equation
    I = trap + I; %summation of intervals
    disp('Trapezoidal rule was used'); %displays the the trapezoidal rule was used
end
