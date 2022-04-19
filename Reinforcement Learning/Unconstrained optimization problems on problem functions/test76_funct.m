function [f] = test76_funct(x)

% Function to compute the given function
%INPUT
%x= input point
%
%OUTPUT
%f_sum=function computed


    n = length(x);
    f = 0;
    for k= 1:n
        if k==n
            f_one = (x(n) - x(1).^2 / 10) .^ 2;
        else
            f_one =(x(k) - x(k+1).^2 / 10).^2;
        end
        f=f+f_one;
    end
    f = f/2;
end