function agents = iter_update(agents)

%copy all surviving and new agents in to a new agent list - dead agents
%will be empty structures

%agent - list of existing agents, including those that have died in the
%current iteration
%nagent - list of surviving agents and empty structures
%nn - number of surviving agents

%global variables
%NO_IT current iteration no
%ITER_STATS data structure for saving model statistics
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
%ENV_DATA - is a data structure containing information about the model
   %environment

    global MESSAGES ITER_STATS NO_IT ENV_DATA

                   %initialise list for surviving agents
    nn=0;                                   %tracks number of surviving agents
    for cn=1:length(agents)
        if ~isa(agents{cn}, 'double')
            dead=MESSAGES.dead(cn);
            if dead==0                          %if agent is not dead
                pos=get(agents{cn},'position');
                MESSAGES.position(cn,:)=pos; 

                water = get(agents{cn},'water');
                MESSAGES.water(cn)=water;  

                energy = get(agents{cn},'energy');
                MESSAGES.energy(cn)=energy; 

                if isa(agents{cn},'tiger')
                    ITER_STATS.tot_tiger(NO_IT+1)=ITER_STATS.tot_tiger(NO_IT+1)+1;

                elseif isa(agents{cn},'deer')
                    ITER_STATS.tot_deer(NO_IT+1)=ITER_STATS.tot_deer(NO_IT+1)+1;

                elseif isa(agents{cn},'boar')            
                    ITER_STATS.tot_boar(NO_IT+1)=ITER_STATS.tot_boar(NO_IT+1)+1;
                end

            elseif dead==1                                    %agent has died
                if isa(agents{cn},'tiger')
                    ITER_STATS.died_tiger(NO_IT+1)=ITER_STATS.died_tiger(NO_IT+1)+1;

                elseif isa(agents{cn},'deer')
                    ITER_STATS.died_deer(NO_IT+1)=ITER_STATS.died_deer(NO_IT+1)+1;

                elseif isa(agents{cn},'boar')            
                    ITER_STATS.died_boar(NO_IT+1)=ITER_STATS.died_boar(NO_IT+1)+1;
                end
                MESSAGES.position(cn,:)=[-1 -1];    %enter dummy position in list
                MESSAGES.atype(cn)=0;               %set type to dead
                agents(cn) = {0};
                MESSAGES.dead(cn)=0;                %clear death message
            end
        end
    end

    ITER_STATS.tot(NO_IT+1)=nn;                %update total agent number
    ITER_STATS.tfood(NO_IT+1)=sum(sum(ENV_DATA.food));   %total food remaining
end