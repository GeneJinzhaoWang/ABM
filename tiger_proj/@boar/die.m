function agt=die(agt,cn)

%death function for class Boar
% agt: boar object
% cn: current number of agent


%Boar dies if its food level reaches zero, or its water level reaches zero 
% or they are older than max_age

    global PARAM ITER_STATS NO_IT MESSAGES
    %PARAM is data structure containing migration speed and breeding
    %NO_IT is current iteration number
    %ITER_STATS is data structure containing statistics on model at eachSS
    %iteration (no. agents etc)
    %MESSAGES is a data structure containing information that agents need to
    %broadcast to each other
    % MESSAGE.dead - n x1 array containing ones for agents that have died
    % in the current iteration


    cfood=agt.energy;           %get current agent food level
    cwater = agt.water;
    age=agt.age;                %get current agent age

    if cfood<=0 || cwater <=0 || age>PARAM.B_MAXAGE
        ITER_STATS.died_boar(NO_IT+1)=ITER_STATS.died_boar(NO_IT+1)+1;      %update statistics
        MESSAGES.dead(cn)=1;                %update message list

    end
    
end