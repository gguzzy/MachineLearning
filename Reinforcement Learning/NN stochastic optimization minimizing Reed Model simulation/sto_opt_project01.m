%close previous workspace and clean c.w. and w.s. again
close all
clc
clear all
format long e

p = [ 0.003, 0.00275, 0.0025, 0.00225, 0.002, 0.00175, 0.0015, 0.00125, 0.001, 0.00075, 0.0005 ]

nsim = 1000; %times simulation is run
period = 60; %total length of period of analysis consided

% social distancing cost
c = @(p) (0.003./p).^9 - 1;
y_c = c(p); %social distancing cost for all probabilities

% A=10;
% B=100;
% %nsim=5000;
% l=2;
% C=0.1;
% t=0.5;

S(1)=999
I(1)=1
sp = 11

%[avg_cost_p] = reed_model_simulation(p, 999, 1, y_c, nsim, period)
%other version of rf version2 
[avg_cost_p]=reed_model_simulation(p, nsim)

tol=1.0e-7;
%x_tr=x-2*ones(1,11);%normalising the input with a traslation 
%new normalization using gosavi pag 56
x_tr=(p-min(p))/(max(p)-min(p));
%x_tr = x;
y = avg_cost_p; %avg_cost_p is our y

%applying the back_prop_NN.m to the test function
[W,v,b,ki,o,SSE_new]=back_propagation_NN(x_tr,y,tol);

%constructing a training set
p2=linspace(0.003,0.00125,15);
y_c2 = c(p2); %social distancing cost for all probabilities

%period2 = 60; %total length of period of analysis consided

[avg_cost_NN] = reed_model_simulation(p2, nsim)

avg_cost_NN;

%p2_tr=p2-2*ones(1,15); negative square matrix

%gosavi method to normalize to values from (0,1)
p2_tr=(p2-min(p2))/(max(p2)-min(p2));
[y_out,SSE]=NN_predict(p2_tr,avg_cost_NN,W,ki,b); %avg_cost_NN our y_training

%plotting the result on the training set
figure('name','prediction on a training set')
plot(p2_tr,avg_cost_NN,'o',p2_tr,y_out','*'); %showing comparisons between real and trained one
xlabel('')
legend('exact value', 'predicted value')