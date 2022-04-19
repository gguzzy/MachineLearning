
tic
clear 
close all
clc



c1 = 1e-4;
rho = 0.5;
btmax = 50;

f= @(x)100*(x(2,:)-x(1,:).^2).^2+(1-x(1,:)).^2;
gradf=@(x)[400*x(1,:).^3-400*x(1,:).*x(2,:)+2*x(1,:)-2;200*(x(2,:)-x(1,:).^2)];
Hessf=@(x)[1200*x(1)^2-400*x(2)+2,-400*x(1);-400*x(1),200];


x0 = [1.2; 1.2];
%x0 = [-1.2; 1];
tolgrad=1e-6;
kmax=30000;




%% RUN THE NEWTON ON f

disp('**** NEWTON: START f *****')

[xk_n2, fk_n2, gradfk_norm_n2, k_n2, xseq_n2, btseq_n2] = ...
    n_bcktrck(x0, f, gradf, Hessf, kmax, ...
    tolgrad, c1, rho, btmax);
disp('**** NEWTON: FINISHED *****')
disp('**** NEWTON: RESULTS *****')
disp('************************************')
disp(['xk: ', mat2str(xk_n2), ' (actual minimum: [1; 1]);'])
disp(['f(xk): ', num2str(fk_n2), ' (actual min. value: 0);'])
disp(['N. of Iterations: ', num2str(k_n2),'/',num2str(kmax), ';'])
disp(['gradfk_norm: ', num2str(gradfk_norm_n2)])
disp('************************************')

disp('---')

%mex test11.f
%test11(10e3,xk_n2,fk_n2,k_n2,11,xseq_n2)

%% PLOTS

% Creation of the meshgrid for the contour-plot
[X1, Y1] = meshgrid(linspace(-6, 6, 500), linspace(-6, 6, 500));

% Creation of the meshgrid for the contour-plot
[X2, Y2] = meshgrid(linspace(-6, 6, 500), linspace(-6, 25, 500));
% Computation of the values of f for each point of the mesh

% Computation of the values of f for each point of the mesh
Z1 = X1.^2 + 4*Y1.^2 + 5;
Z2 = 100*(Y2-X2.^2).^2+(1-X2).^2;
Z3 = (X1.^2+Y1-11).^2+(X1+Y1.^2-7).^2;



% Plots


% Simple Plot
fig2_n = figure();
% Contour plot with curve levels for each point in xseq
[C2, ~] = contour(X2, Y2, Z2);
hold on
% plot of the points in xseq
plot([x0(1) xseq_n2(1, :)], [x0(2) xseq_n2(2, :)], '--*')
hold off
title('Newton - Rosenbrock')

% Barplot of btseq
fig2_bt = figure();
bar(btseq_n2)
title('Newton - Rosenbrock')

% Much more interesting plot
fig2_surf = figure();
surf(X2, Y2, Z2,'EdgeColor','none')
hold on
plot3([x0(1) xseq_n2(1, :)], [x0(2) xseq_n2(2, :)], [f(x0), f(xseq_n2)], 'r--*')
hold off
title('Newton - Rosenbrock')
toc
