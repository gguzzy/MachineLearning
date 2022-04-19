function [f_sum] = test25_funct(x)
% Function to compute the given function
%INPUT
%x= input point
%
%OUTPUT
%f_sum=function computed

f_sum=0;

n=length(x);
for k = 1:n
    if mod(k,2)==1
        one_var_f=50*(x(k).^2-x(k+1)).^2;     
    elseif mod(k,2)==0
        one_var_f=(1/2)*(x(k-1)-1).^2;    
    end
    f_sum=f_sum+one_var_f;
end
end
