function [agt, to_destiny,target] = migrate(agt, decision)
%MIGRATE Summary For Tiger
%   Detailed explanation goes here
    global ENV_DATA PARAM MESSAGES
    tiger_pos = agt.position;
    to_destiny = false;
    target = 0;
    
    %   Decision change from 0 to 2.
    % decision==0 means the Tiger will move randomly.
    % decision==1 means the Tiger is in thirst and will move towards the nearest pool.
    % decision==2 means the Tiger is in hunger and will move towards the nearest food.
    switch decision
%       Move randomly
        case 0
            [agt, to_destiny] = move_randomly(agt);
            
%       Move towards pool
        case 1
            % Find the nearest pool first.
            pool_centers = ENV_DATA.pool_center(ENV_DATA.active_pool_center,:);
            % Calculate the distance to all pools
            dist2pools=sqrt((pool_centers(:,1)-tiger_pos(1)).^2+(pool_centers(:,2)-tiger_pos(2)).^2);  %calculate distance to all prey
            % Filter the nearest one
            [pool_d,pool_ind]=min(dist2pools); 
            % Find the cneters of the pool            
            pool_x = pool_centers(pool_ind,1);
            pool_y = pool_centers(pool_ind,2);
            % Animal can get there within one hour
            if pool_d <= PARAM.T_SPD
                agt.position(1) = pool_x; 
                agt.position(2) = pool_y; 
                to_destiny=true;
                
            % animal cannot get to the pool within one hour will head the direction and move as far as they can                 
            else
                direction = [pool_x-agt.position(1),pool_y-agt.position(2)];
                dist = norm([pool_x,pool_y]-agt.position);
                agt.position = PARAM.B_SPD/dist*direction + agt.position;
            end
            
%         Move towards prey    
         case 2
            typ=MESSAGES.atype;	%extract types of all agents
            prey_all=find(typ>1);

            prey_pos=MESSAGES.position(prey_all,:);      %extract positions of all prey
            dist_prey=sqrt((prey_pos(:,1)-tiger_pos(1)).^2+(prey_pos(:,2)-tiger_pos(2)).^2);  %calculate distance to all prey
            [prey_d,prey_ind]=min(dist_prey);                                            %prey_d is distance to closest prey, prey_d is index of that prey
            ptt_targets=prey_all(prey_ind);
            
            % the ambush status
            if agt.ambush
                search_radius = 0.5;
            else
                search_radius = PARAM.T_SPD;
            end
            
            if prey_d<=search_radius && ~isempty(ptt_targets)
                if length(ptt_targets)>1       %if more than one prey located at same distance then randomly pick one to head towards
                    s=round(rand*(length(ptt_targets)-1))+1;
                    target=ptt_targets(s);
                else
                    target=ptt_targets(1);
                end

                nx=MESSAGES.position(target,1);    %extract exact location of this prey
                ny=MESSAGES.position(target,2);
                npos=[nx ny];    
                agt.position=npos;
                MESSAGES.targeted(target)=1;
                to_destiny = true;
            
            % Cannot reach the prey within one iter
            else
                [agt, ~] = move_randomly(agt);
            end


       
    end
    
end

