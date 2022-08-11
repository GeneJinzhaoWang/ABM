function agt=eat(agt, to_destiny, ~)
    % eating function for class Boar
    % agt=Boar object
    % to_destiny, true or false, indicates the boar reach the destiny or not
    
    global PARAM
    %SUMMARY OF Boar EAT RULE
    %Boar detects food level in its 1km x 1km square of the environment
    %if to_destiny==true, boar will consume food
    %otherwise Boar energy level decreased by a certain value indicated in 
    % PARAM.B_ENERGY_DECAY.

        if to_destiny
            agt.energy=100;
        else
            agt.energy=agt.energy-PARAM.B_ENERGY_DECAY;
        end

    
end