function [avg_cost_p] = reed_model_simulation(p, nsim)

period=60;

% social distancing cost
c = @(p) (0.003./p).^9 - 1;
y_c = c(p); %social distancing cost for all probabilities

S(1)=999;
I(1)=1;
sp = length(p);

for k=1:sp
    %average cost column vector, vector initialized to 1000x1 per each probability
    for i=1:nsim
        tmp_avg_cost=zeros(1,sp);
        tmp_avg_cost(i) = y_c(k)+I(1);%tmp avg cost for whole period, set to 0 at start each simulation
        for t=1:period-1
            I(t+1) = binornd(S(t),1-(1-p(k)).^(I(t))) ;
            S(t+1) = S(t)-I(t+1) ;
            if S(t+1)<=0
                tmp_avg_cost(t+1) = tmp_avg_cost(t) + I(t+1); 
            else if y_c(k)>=0
                    tmp_avg_cost(t+1) = tmp_avg_cost(t) + y_c(k) + I(t+1); %social distancing cost + cost of previous infected that has to recover
                end
            end
        %avg_cost_period(i) = sum(tmp_avg_cost)/period;
        avg_cost_period(i)=mean(tmp_avg_cost);
    end
    %avg_cost_p(k) = sum(avg_cost_period)/nsim;
    avg_cost_p(k)=mean(avg_cost_period);
    %assign for each sim avg cost of whole period considered
    end
   
end

