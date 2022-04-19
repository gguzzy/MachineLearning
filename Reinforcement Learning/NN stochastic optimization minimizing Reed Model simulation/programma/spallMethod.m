function [x_sp] = spallMethod()
% Parameters using Gosavi suggestions a=10, B=100, C=0.1, l=1, t=0.5
A=10;
B=100;
nsim=1000;
l=2; % increased the ratio, avoiding too far ranges of values->closer (not too much)
C=0.1;
t=0.5;
tol=0.001;

%%-----------SPALL METHOD--------------------
for j=1:10 %the ten best minimum we get
	x0=unifrnd(1,3); %Starting point (for both methods)
	h=0.01; %step in the gradient approx
    i=1;%counter
    %Values to start the cycle
    x_curr=x0;
    x_next=2;
    err=1;
    i=1;
    %for each iteration we update x_curr following the steepest descent
    %principle. Here we approximate dM using the spall method
    while(err>tol)
        h=unifrnd(-1,1);
        c=C/i^t;
        mu=A/((B+i)^l);
        dM=(reed_model_simulation(x_curr+c*h, nsim)-reed_model_simulation(x_curr-c*h, nsim))/(2*c*h);
        x_next=x_curr+mu*dM;

        err=norm(x_next-x_curr, inf)/norm(x_next, inf);
        x_curr=x_next;
        i=i+1;
    end
    %%we save the result of the method for each simulation
        X_SP(j,1)=x_next;
        X_SP(j,2)=reed_model_simulation(x_next, nsim);
end

% Sum of squared difference
% figure(1)
% plot(X_SP)
% hold on

x_sp=min(X_SP(X_SP(:,2)==min(X_SP(:,2)))/100) %result from the spall method

end

