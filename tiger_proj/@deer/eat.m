function agt=eat(agt, to_destiny, ~)
    % eating function for class Deer
    % agt=Deer object
    % to_destiny, true or false, indicates the deer reach the destiny or not
    
    global PARAM
    %SUMMARY OF Boar EAT RULE
    %Deer detects food level in its 1km x 1km square of the environment
    %if to_destiny==true, deer will consume food
    %otherwise Deer energy level decreased by a certain value indicated in 
    % PARAM.D_ENERGY_DECAY.

        if to_destiny
            agt.energy=100;
        else
            agt.energy=agt.energy-PARAM.D_ENERGY_DECAY;
        end

    
end