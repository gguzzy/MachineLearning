function [f_sum] = test1_funct(x)

% Function to compute the given function
%INPUT
%x= input point
%
%OUTPUT
%f_sum=function computed

n=length(x);

f_sum = sum(100*(-x(2:n)+x(1:n-1).^2).^2 + (x(1:n-1)-1).^2);
%disp(f_sum)
end
