function agt=eat(agt,to_destiny, target)

%SUMMARY OF TIGER EAT RULE
% Tiger has 10% of the change to hunt the prey
% If the tiger is ambushed near the water during dry season, then the
% probability is 100%.
    global MESSAGES PARAM
    % Find the target
    if to_destiny
        % Check the hunting probability of the tiger
        if agt.ambush == true
            probability= 1;
            agt.ambush = false;

        else
            probability = 0.1;
        end
        
        if probability >= rand
            agt.energy = 100;
            MESSAGES.dead(target)=1;
        else
            agt.energy = agt.energy - PARAM.T_ENERGY_DECAY;
            MESSAGES.targeted(target)=1;
        end
        
    % Does not find the target
    else
        agt.energy = agt.energy - PARAM.T_ENERGY_DECAY;
    end
    
end
