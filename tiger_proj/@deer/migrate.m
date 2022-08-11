function [agt, to_destiny,target] = migrate(agt, decision)
%MIGRATE Summary For Deer
%   Detailed explanation goes here
    global ENV_DATA PARAM 
    deer_pos = agt.position;
    to_destiny = false;
    target = 0;
%   Decision change from 0 to 2.
% decision==0 means the deer will move randomly.
% decision==1 means the deer is in thirst and will move towards the nearest pool.
% decision==2 means the deer is in hunger and will move towards the nearest food.
    switch decision
%       Move randomly
        case 0
            [agt, to_destiny] = move_randomly(agt);
            
%       Move towards pool
        case 1
%           Find the nearest pool first.
            pool_centers = ENV_DATA.pool_center(ENV_DATA.active_pool_center,:);
%           Calculate the distance to all pools
            dist2pools=sqrt((pool_centers(:,1)-deer_pos(1)).^2+(pool_centers(:,2)-deer_pos(2)).^2);  %calculate distance to all prey
%           Filter the nearest one
            [pool_d,pool_ind]=min(dist2pools); 
%           Find the cneters of the pool            
            pool_x = pool_centers(pool_ind,1);
            pool_y = pool_centers(pool_ind,2);
%           animal can get there within one hour
            if pool_d <= PARAM.D_SPD
                agt.position(1) = pool_x; 
                agt.position(2) = pool_y; 
                to_destiny=true;
%           animal cannot get there within one hour will head the direction and move                 
            else
                direction = [pool_x-agt.position(1),pool_y-agt.position(2)];
                dist = norm([pool_x,pool_y]-agt.position);
                agt.position = PARAM.D_SPD/dist*direction + agt.position;
            end
            
%       Move towards food    
        case 2
            food_nearby =  ENV_DATA.food(ceil(agt.position(1)),ceil(agt.position(2)));
            % if they arrive at the position, then set to_destiny to true
            if food_nearby >0
                to_destiny=true;
            % if they does not arrive at the position, then set to_destiny
            % to false and move randomly
            else
                [agt, ~] = move_randomly(agt);
                to_destiny = false;

            end
    end
    
end

