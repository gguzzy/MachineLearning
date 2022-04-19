function [xk,fk,gradfk_norm,k,xseq,btseq] = steepest_desc_bcktrck(x0,f,gradf,alpha0,kmax,tollgrad,c1,rho,btmax)

%Function for computing Steepest Descent using backtracking strategy
%INPUTS: 
% x0 = n-dimensional column vector;
% f = function handle that describes a function R^n->R;
% gradf = function handle that describes the gradient of f;
% kmax = maximum number of iterations permitted;
% tollgrad = value used as stopping criterion w.r.t. the norm of the
% gradient;
% c1 = ﻿the factor of the Armijo condition that must be a scalar in (0,1);
% rho = ﻿fixed factor, lesser than 1, used for reducing alpha0;
% btmax = ﻿maximum number of steps for updating alpha during the 
% backtracking strategy.
%
% OUTPUTS:
% xk = the last x computed by the function;
% fk = the value f(xk);
% gradfk_norm = value of the norm of gradf(xk)
% k = index of the last iteration performed
% xseq = n-by-k matrix where the columns are the xk computed during the 
% iterations
% btseq = 1-by-k vector where elements are the number of backtracking
% iterations at each optimization step.


%function handler for amrmijo condition
farmijo=@(fk,alpha, xk,pk) fk+c1*alpha*gradf(xk)'*pk;

%initializations
xseq=zeros(length(x0),kmax);
btseq=zeros(1,kmax);
%initialization for the while cycles
xk=x0;

fk=f(xk);
gradfk_norm=norm(gradf(xk));
k=0;

while k<=kmax && gradfk_norm >= tollgrad
    %compute the descent direction pk
    disp(k)
    %tic
    pk = -gradf(xk);

    alpha=alpha0;
    %compute the new value of xk
    xnew = xk+alpha*pk;

    fnew=f(xnew);

    
    %backtracking strategy
    bt=0;
    
    while bt<btmax && fnew>farmijo(fk,alpha,xk,pk)
        alpha=rho*alpha;

        xnew = xk+alpha*pk;
        fnew=f(xnew);
        bt=bt+1;
        
    end
    xk=xnew;
    fk=fnew;
    
    gradfk_norm=norm(gradf(xk));
    %increment of the step
    k=k+1;
    
    %store the current xk in xseq
    xseq(:,k)=xk;

    btseq(k)=bt;
    %toc
end
  
  
% "Cut" xseq to the correct size
xseq = xseq(:, 1:k);


btseq=btseq(1:k);
end

