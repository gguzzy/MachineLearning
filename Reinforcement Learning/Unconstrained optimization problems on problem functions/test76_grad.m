function gradient = test76_grad(x)
%Function for computing the gradient
%INPUT
%x= input point
%
%OUTPUT
%gradient=gradient computed

    n = length(x);
    gradient = zeros(n, 1);
    
    
    for k = 1:n
        switch k
            case 1
                gradient(k) = x(k) - 0.1 * x(k+1).^2 - 0.2 * x(k) * x(n) + 0.02 * x(k).^3;
            case n
                gradient(k) = -0.2 * x(k-1) * x(k) + 0.02 * x(k).^3 + x(k) - 0.1 * x(1).^2;
            otherwise
                gradient(k) = -0.2 * x(k-1) * x(k) + 0.02 * x(k).^3 + x(k) - 0.1 * x(k+1).^2;
        end
    end
end