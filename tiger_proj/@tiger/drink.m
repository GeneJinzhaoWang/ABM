function agt=drink(agt, to_destiny)

    %Drink function for class Tiger
    % agt=Tiger object
    % to_destiny, true or false, indicates the Tiger reach the destiny or not
    
    %SUMMARY OF DRINK RULE
    %   If Tiger arrives at the destiny, it will drink and its water level
    %   will increase to 100.
    %   If Tiger does not drink, it's water will reduce by a certain value 
    %   indicated in PARAM.T_ENERGY_DECAY.

    global PARAM

    if to_destiny
        agt.water = 100;
    else
        agt.water = agt.water -PARAM.T_WATER_DECAY;
    end
    

end
   
