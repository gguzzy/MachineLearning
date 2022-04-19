function [gradient] = test25_grad(x)
%Function for computing the gradient
%INPUT
%x= input point
%
%OUTPUT
%gradient=gradient computed


n=length(x);
gradient=zeros(n,1);
for k = 1:n
    if mod(k,2)==1
       gradient(k)=200*x(k).^3-200*x(k)*x(k+1)+x(k)-1;
    elseif mod(k,2)==0
        gradient(k)=100*x(k)-100*x(k-1).^2;
        
    end
end
%disp(gradient)
    


end
