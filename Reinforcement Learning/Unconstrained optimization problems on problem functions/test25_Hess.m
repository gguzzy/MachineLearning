function [Hessf_sum] = test25_Hess(x)
%Function for computing the Hessian matrix exploiting sparsity pattern
%INPUT
%x= input point
%
%OUTPUT
%Hessf_sum= Hessian matrix computed


n=length(x);
main=zeros(n,1);
upper=zeros(n,1);
lower=zeros(n,1);
for k=1:n
    if mod(k,2)==1
             
        main(k)=600*x(k).^2-200*x(k+1)+1;
        lower(k)=-200*x(k);

    elseif mod(k,2)==0
        main(k)=100;
        upper(k)=-200*x(k-1);
    end
    
    
end
%upper=circshift(upper,-1);
Hessf_sum=spdiags([lower main upper],[-1 0 1],n,n);
% disp(['x=',mat2str(x)])
% disp(['up=',mat2str(upper)])
% disp(['main',mat2str(main)])
% disp(['lower',mat2str(lower)])
% full(Hessf_sum)
end
