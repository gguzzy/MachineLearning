function Hessf_sum = test76_Hess(x)
%Function for computing the Hessian matrix exploiting sparsity pattern
%INPUT
%x= input point
%
%OUTPUT
%Hessf_sum= Hessian matrix computed

n = length(x);
main=zeros(n,1);
upper=zeros(n,1);
lower=zeros(n,1);
for k=1:n
    if k==1
        main(k)=(3*x(k).^2)/50-(x(n)/5)+1;
        lower(k)=-x(k)/5;
    else
        
        main(k)=(3*x(k).^2)/50-(x(k-1)/5)+1;
        upper(k)=-x(k-1)/5;
        lower(k)=-x(k)/5;
    end
    
    
end
%upper=circshift(upper,1);
Hessf_sum=spdiags([lower main upper],[-1 0 1],n,n);
Hessf_sum(1,n)=-x(1)/5;
Hessf_sum(n,1)=-x(1)/5;
% disp(['x=',mat2str(x)])
% disp(['up=',mat2str(upper)])
% disp(['main',mat2str(main)])
% disp(['lower',mat2str(lower)])
% full(Hessf_sum)

end