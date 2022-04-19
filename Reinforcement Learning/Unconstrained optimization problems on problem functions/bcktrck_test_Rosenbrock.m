clear 
clc
tic
alpha0 = 1;
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


% Creation of the meshgrid for the contour-plot
[X1, Y1] = meshgrid(linspace(-6, 6, 500), linspace(-6, 6, 500));

% Creation of the meshgrid for the contour-plot
[X2, Y2] = meshgrid(linspace(-6, 6, 500), linspace(-6, 25, 500));
% Computation of the values of f for each point of the mesh

% Computation of the values of f for each point of the mesh
Z1 = X1.^2 + 4*Y1.^2 + 5;
Z2 = 100*(Y2-X2.^2).^2+(1-X2).^2;
Z3 = (X1.^2+Y1-11).^2+(X1+Y1.^2-7).^2;

% Simple Plot
fig2 = figure();
% Contour plot with curve levels for each point in xseq
[C2, ~] = contour(X2, Y2, Z2);
hold on
% plot of the points in xseq
plot([x0(1) xseq(1, :)], [x0(2) xseq(2, :)], '--*')
hold off
title('Newton - Rosenbrock')

% Barplot of btseq
fig2_bt = figure();
bar(btseq)
title('Newton - Rosenbrock')

% Much more interesting plot
fig2_surf = figure();
surf(X2, Y2, Z2,'EdgeColor','none')
hold on
plot3([x0(1) xseq(1, :)], [x0(2) xseq(2, :)], [f(x0), f(xseq)], 'r--*')
hold off
title('Newton - Rosenbrock')
toc



