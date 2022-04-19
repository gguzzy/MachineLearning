function [gra] = test1_grad(x)
%Function for computing the gradient
%INPUT
%x= input point
%
%OUTPUT
%gra=gradient computed


n=length(x);
gra=zeros(n,1);
 
for k=1:n
    switch k
        case 1
            gra(k)=2*x(k)+400*x(k).^3-400*x(k)*x(k+1)-2;
        case n
            gra(k)=-200*x(k-1).^2+200*x(k);
        otherwise
            gra(k)=-200*x(k-1).^2 + 202*x(k)-400*x(k)*x(k+1)+400*x(k).^3-2;
        
    end
end
 


%disp(x)
%disp(gra)
end
