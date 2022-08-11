function agents = agent_action(agents)
%sequence of functions called to apply agent rules to current agent population.
%agents - list of existing agent structures

    n=length(agents);    %current no. of agents

% randomise the order of  behavior rules applying to agents 
% execute existing agent update loop
    for cn=randperm(n)
        curr=agents{cn};
        
        if ~isa(curr, 'double')
            status_flag = check_status(curr,cn);
            switch status_flag
                
% case 0: Animal is neither hungry nor thirsty hence, it hangs out in a
% random directoin
                case 0
                    [curr,~,~]=migrate(curr, 0);
                    curr = drink(curr, false);
                    curr = eat(curr, false, 0);
                    curr = die(curr,cn);

% case 1: Animal is thirsty (though probably hungry but thirst is 
% considered with a high priority), it will head to the nearest
% pool
                case 1
                    [curr, to_destiny,~]=migrate(curr, 1);
                    curr = drink(curr, to_destiny);
                    curr = eat(curr, false, 0);
                    curr = die(curr,cn);

% case 2: Animal is hungry (though probably hungry but thirst is 
% considered with a high priority), it will head to the nearest
% pool

                case 2
                    [curr, to_destiny,target]=migrate(curr, 2);
                    curr = drink(curr, false);
                    curr = eat(curr, to_destiny, target);
                    curr = die(curr,cn);
            end

            agents{cn}=curr;                          %up date cell array with modified agent data structure
        end
    end
    agents = iter_update(agents);   %function which update message list and 'kills off' dead agents.

end


function status_f = check_status(agent,cn)
    global PARAM MESSAGES
    
    % The dead agent will be marked as 0, a double data type.
    water = agent.water;
    energy = agent.energy;
    status_f = 0;

%   If the agent is a tiger
    if isa(agent,'tiger')
        %   Currently under the trigger status of ambush.
        if water <= PARAM.T_THIRST
            status_f = 1; 
            if energy <= PARAM.T_HUNGER
                agent.ambush = rand<0.5;
            end
            
        elseif energy <= PARAM.T_HUNGER
            status_f = 2;
            
        end

    elseif isa(agent,'boar')
        if MESSAGES.targeted(cn)==0
            if water <= PARAM.B_THIRST
                status_f = 1;   
            elseif energy <= PARAM.B_HUNGER
                status_f = 2;
            end
        % When the agent is being hunted this iter, they will run randomly without eating and drinking
        else

            disp('targeted prey found')
            MESSAGES.targeted(cn)=0;
        end

    elseif isa(agent,'deer')
        if MESSAGES.targeted(cn)==0
            if water <= PARAM.D_THIRST
                status_f = 1;   
            elseif energy <= PARAM.D_HUNGER
                status_f = 2;
            end
        % When the agent is being hunted this iter, they will run randomly without eating and drinking
        else
            disp('targeted prey found')
            MESSAGES.targeted(cn)=0;
        end
    end
end