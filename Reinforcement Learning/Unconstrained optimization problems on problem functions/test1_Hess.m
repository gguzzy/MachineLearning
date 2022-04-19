function [Hessf_sum] = test1_Hess(x)
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
    switch k
        case 1
            main(k)=1200*x(k).^2-400*x(k+1)+2;
            upper(k)=-400*x(k);
            lower(k)=-400*x(k);
        case n
            main(k)=200;
        otherwise
            upper(k)=-400*x(k);
            main(k)=1200*x(k).^2-400*x(k+1)+202;
            lower(k)=-400*x(k);
    end
end

upper=circshift(upper,1);
Hessf_sum=spdiags([lower main upper],[-1 0 1],n,n);
%Hessf_sum=spdiags(main,0,n,n);
% disp(['x=',mat2str(x)])
% disp(['up=',mat2str(upper)])
% disp(['main',mat2str(main)])
% disp(['lower',mat2str(lower)])

disp(['check symm pos def',mat2str(sum(main))])

if sum(main)>0
    disp('ok, the matrix is symmetric positive definite')
else
    disp("the matrix is NOT positive definite,Newton can't be applied")

%full(Hessf_sum)
end
