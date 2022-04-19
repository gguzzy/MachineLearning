
clear 
clc
tic
alpha0 = 1;
c1 = 1e-4;
rho = 0.5;
btmax = 50;

f= @(x) test25_funct(x);
gradf=@(x) test25_grad(x);
Hessf=@(x) test25_Hess(x);
d=3; %or 4
n=10^d;

x0=ones(n,1);

for i = 1:n
    if mod(i,2)==1
        x0(i)=-1.2;
    end
      
     
end
tolgrad=1e-6;
kmax=30000;%a 30000 converge bene

h = sqrt(eps);


%% RUN THE STEEPEST DESCENT

disp('**** STEEPEST DESCENT: START *****')

[xk, fk, gradfk_norm, k, xseq, btseq] = ...
    steepest_desc_bcktrck(x0, f, gradf, alpha0, kmax, ...
    tolgrad, c1, rho, btmax);
disp('**** STEEPEST DESCENT: FINISHED *****')
disp('**** STEEPEST DESCENT: RESULTS *****')
disp('************************************')
disp(['xk: ', mat2str(xk), ' (actual minimum: [1; 1]);'])
disp(['f(xk): ', num2str(fk), ' (actual min. value: 0);'])
disp(['N. of Iterations: ', num2str(k),'/',num2str(kmax), ';'])
disp(['gradfk_norm: ', num2str(gradfk_norm)])
disp('************************************')

%% Plots



% Barplot of btseq
fig2_bt = figure();
bar(btseq)
title('Newton - Extended Rosenbrock')

toc



