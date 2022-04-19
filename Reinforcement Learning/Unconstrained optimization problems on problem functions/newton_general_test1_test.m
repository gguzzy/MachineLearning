

clear 
close all
clc
tic

c1 = 1e-4;
rho = 0.5;
btmax = 50;


f= @(x) test1_funct(x);
gradf=@(x) test1_grad(x);
Hessf=@(x) test1_Hess(x);

tolgrad=1e-6;
kmax=30000;
d=3; %or 4
n=10^d;




%Proposed Starting Point
% x0=ones(n,1); %in questo caso parto da zero
% for i = 1:n
%     if mod(i,2)==1
%         x0(i)=-1.2;
%     end
%       
%      
% end

%New Starting Point
x0=zeros(n,1);




disp('**** NEWTON: START  *****')

[xk, fk, gradfk_norm, k, xseq, btseq] = ...
    n_bcktrck(x0, f, gradf, Hessf, kmax, ...
    tolgrad, c1, rho, btmax);


disp('**** NEWTON: FINISHED *****')
disp('**** NEWTON: RESULTS *****')
disp('************************************')
disp(['xk: ', mat2str(xk), ' (actual minimum: [1; 1]);'])
disp(['f(xk): ', num2str(fk), ' (actual min. value: 0);'])
disp(['N. of Iterations: ', num2str(k),'/',num2str(kmax), ';'])
disp(['gradfk_norm: ', num2str(gradfk_norm), ';'])
disp('************************************')

disp('---')


%% PLOTS

% Barplot of btseq
fig2_bt = figure();
bar(btseq)
title('Newton - Chained Rosenbrock')



toc

