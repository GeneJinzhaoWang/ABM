function agt=die(agt,cn)

%death function for class Tiger
%agt=tiger object


    global PARAM ITER_STATS NO_IT MESSAGES
    %NO_IT is current iteration number
    %ITER_STATS is data structure containing statistics on model at eachSS
    %iteration (no. agents etc)
    %PARAM is data structure containing migration speed and age threshold
    %MESSAGES is a data structure containing information that agents need to
    %broadcast to each other
       %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
       %    (1=tiger, 2-deer, 3=boar)
       %    MESSAGES.pos - list of every agent position in [x y]
       %    MESSAGE.dead - n x1 array containing ones for agents that have died
       %    in the current iteration


    cfood=agt.energy;           %get current agent food level
    cwater = agt.water;
    age=agt.age;                %get current agent age

    if cfood<=0 || cwater <=0 ||  age>PARAM.T_MAXAGE  %if water level and food level < 0 and age > max age then agent dies
        ITER_STATS.died_tiger(NO_IT+1)=ITER_STATS.died_tiger(NO_IT+1)+1;      %update statistics
        MESSAGES.dead(cn)=1; 
    end
    
end