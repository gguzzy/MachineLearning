
tic
clear 
close all
clc


c1 = 1e-4;
rho = 0.5;
btmax = 50;


f= @(x) test76_funct(x);
gradf=@(x) test76_grad(x);
Hessf=@(x) test76_Hess(x);

tolgrad=1e-6;
kmax=100;
d=7; %or 4
n=10^d;







x0=2*ones(n,1);




%% RUN THE NEWTON ON PROBLEM 76

disp('**** NEWTON: START *****')

[xk, fk, gradfk_norm, k, xseq, btseq] = ...
    n_bcktrck(x0, f, gradf, Hessf, kmax, ...
    tolgrad, c1, rho, btmax);
disp('**** NEWTON: FINISHED *****')
disp('**** NEWTON: RESULTS *****')
disp('************************************')
disp(['xk: ', mat2str(xk) ])
disp(['f(xk): ', num2str(fk)])
disp(['N. of Iterations: ', num2str(k),'/',num2str(kmax), ';'])
disp(['gradfk_norm: ', num2str(gradfk_norm), ';'])
disp('************************************')

disp('---')

%% PLOTS
% Barplot of btseq
fig2_bt = figure();
bar(btseq)
title('Newton - Problem 76')
toc


