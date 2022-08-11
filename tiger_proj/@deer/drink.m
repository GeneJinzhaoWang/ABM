function agt=drink(agt, to_destiny)

    %Drink function for class Deer
    % agt=Deer object
    % to_destiny, true or false, indicates the deer reach the destiny or not
    
    %SUMMARY OF Drink EAT RULE
    %   If deer arrives at the destiny, it will drink and its water level
    %   will increase to 100.
    %   If deer does not drink, it's water will reduce by a certain value 
    %   indicated in PARAM.D_ENERGY_DECAY.

    global PARAM

    if to_destiny
        agt.water = 100;
    else
        agt.water = agt.water -PARAM.D_WATER_DECAY;
    end
    

end