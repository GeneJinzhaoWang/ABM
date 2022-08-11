function update_environment
%UPDATE_ENVIRONMENT Summary of this function goes here
%   Detailed explanation goes here
    global NO_IT ENV_DATA ITER_STATS
%    Eleminate previous marks
    ENV_DATA.active_pool_center(:)=1;
    pool_num = ENV_DATA.water_spot;
%     months = mod(ceil(NO_IT),12);
    months = mod(ceil(NO_IT/12/30),12);
    if months == 0
        months = 12;
    end
    % percentage of deactive pools change with months 
    deactive_pools=[0.050, 0.067,0.084, 0.100, 0.091, 0.076, 0.048, 0.024, 0.002, 0.000, 0.017,0.034];
    deactive_nums = ceil(deactive_pools(months)*pool_num);

    rng(43);
    deactive_seq = randperm(pool_num);
    
    for i=1:pool_num
            center = ceil(ENV_DATA.pool_center(i,:));
            ENV_DATA.water(center(1):center(1),center(2):center(2))=100;
    end
    
    if deactive_nums>0      
        %  Mark the dry pool
        deactive_pool = deactive_seq(1:deactive_nums);

        ENV_DATA.active_pool_center(deactive_pool)=0;
        for i=1:deactive_nums
            center = ceil(ENV_DATA.pool_center(deactive_pool(i),:));
            ENV_DATA.water(center(1):center(1),center(2):center(2))=0;

        end
        
    end
    ITER_STATS.no_water(NO_IT+1)= length(find(ENV_DATA.active_pool_center==true)); %update total number of active water pools
end

