function agt=drink(agt, to_destiny)

    %Drink function for class Boar
    % agt=Boar object
    % to_destiny, true or false, indicates the boar reach the destiny or not
    
    %SUMMARY OF Drink EAT RULE
    %   If boar arrives at the destiny, it will drink and its water level
    %   will increase to 100.
    %   If boar does not drink, it's water will reduce by a certain value 
    %   indicated in PARAM.B_ENERGY_DECAY.

    global PARAM

    if to_destiny
        agt.water = 100;
    else
        agt.water = agt.water -PARAM.B_WATER_DECAY;
    end
    

end