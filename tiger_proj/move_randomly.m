function [agt, to_destiny] = move_randomly(agt)
    global ENV_DATA PARAM 
    center_x = ENV_DATA.size/2;
    center_y = ENV_DATA.size/2;
    direction = 360*rand; %generate random angle

    delta_x = sin(direction);  %calculate according delta x and delta y
    delta_y = cos(direction);

    temp_x = agt.position(1) +delta_x; 
    temp_y = agt.position(2) +delta_y;

    if temp_x<0 || temp_x > ENV_DATA.size || temp_y<0 || temp_y > ENV_DATA.size

        direction = [center_x-agt.position(1),center_y-agt.position(2)];
        dist = norm([center_x,center_y]-agt.position);

        agt.position = PARAM.T_SPD/dist*direction + agt.position;
    else
        agt.position(1) = agt.position(1) +delta_x; 
        agt.position(2) = agt.position(2) +delta_y; 
    end
    to_destiny= true;
    
end

