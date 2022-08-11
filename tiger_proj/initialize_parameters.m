function initialize_parameters
%INITIALIZE_PARAMETERS Summary of this function

%PARAM - structure containing values of all parameters governing agent
%behaviour for the current simulation

    global PARAM
% All the animal will stay active for 12 hours per day.   
    PARAM.T_SPD=2.7;       %speed of movement - units per itn (tiger)
    PARAM.D_SPD=1;         %speed of movement - units per itn (deer)
    PARAM.B_SPD=1;         %speed of movement - units per itn (boar)

    PARAM.T_MINFOOD=0;     %minimum food threshold before agent dies 
    PARAM.D_MINFOOD=0;
    PARAM.B_MINFOOD=0;
    
    PARAM.T_MAXAGE=9;      %maximum age allowed 
    PARAM.D_MAXAGE=8;
    PARAM.B_MAXAGE=5;
    
    PARAM.T_HUNGER=58;     % hunger threshold 
    PARAM.D_HUNGER=96;
    PARAM.B_HUNGER=96;
    
    PARAM.T_THIRST=64;     % thirst threshold 
    PARAM.D_THIRST=64;
    PARAM.B_THIRST=64;

    PARAM.T_ENERGY_DECAY = 0.5; % The energy decay per iteration
    PARAM.D_ENERGY_DECAY = 1; % 
    PARAM.B_ENERGY_DECAY = 1; % 
    
    PARAM.T_WATER_DECAY = 3; % The water decay per iteration
    PARAM.D_WATER_DECAY = 3; % 
    PARAM.B_WATER_DECAY = 3; % 
    
end

