
clear 
clc
tic
alpha0 = 1;
c1 = 1e-4;
rho = 0.5;
btmax = 50;

f= @(x) test76_funct(x);
gradf=@(x) test76_grad(x);
Hessf=@(x) test76_Hess(x);

%DIMENSIONALITY
d=7; %or 4
n=10^d;

x0=2*ones(n,1);



tolgrad=1e-6;
kmax=100;

h = sqrt(eps);


%% RUN THE STEEPEST DESCENT

disp('**** STEEPEST DESCENT: START *****')

[xk, fk, gradfk_norm, k, xseq, btseq] = ...
    steepest_desc_bcktrck(x0, f, gradf, alpha0, kmax, ...
    tolgrad, c1, rho, btmax);
disp('**** STEEPEST DESCENT: FINISHED *****')
disp('**** STEEPEST DESCENT: RESULTS *****')
disp('************************************')
disp(['xk: ', mat2str(xk)])
disp(['f(xk): ', num2str(fk),])
disp(['N. of Iterations: ', num2str(k),'/',num2str(kmax), ';'])
disp(['gradfk_norm: ', num2str(gradfk_norm)])
disp('************************************')

%% Plots


% Barplot of btseq
fig2_bt = figure();
bar(btseq)
title('Steepest Descent - Problem 76')



toc



