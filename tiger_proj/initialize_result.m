function initialize_result(no_tiger,no_deer, no_boar,no_iters)

 global  ITER_STATS ENV_DATA 
 
%set up data structure to record statistics for each model iteration
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc)
%ENV_DATA - data structure representing the environment 
 
 ITER_STATS=struct('died_tiger',[zeros(1,no_iters+1)],...			%no. agents dying per iteration
                'died_deer',[zeros(1,no_iters+1)],...	
                'died_boar',[zeros(1,no_iters+1)],...
                'eaten',[zeros(1,no_iters+1)],...              %no. of prey eaten per iteration
                'tot',[zeros(1,no_iters+1)],...				%total no. agents in model per iteration
                'tot_tiger',[zeros(1,no_iters+1)],...             % total no. tiger
                'tot_deer',[zeros(1,no_iters+1)],...             % total no. deer
                'tot_boar',[zeros(1,no_iters+1)],...             % total no. boar
                'tfood',[zeros(1,no_iters+1)],...               %remaining vegetation level
                'no_water',[zeros(1,no_iters+1)]);          %active water pool number
            
 
     tf=sum(sum(ENV_DATA.food));            %remaining food is summed over all squares in the environment
     ITER_STATS.tot(1)=no_tiger+no_deer + no_boar;
     ITER_STATS.tot_tiger(1)=no_tiger;
     ITER_STATS.tot_deer(1)=no_deer;
     ITER_STATS.tot_boar(1)=no_boar;
     ITER_STATS.tfood(1)=tf;
     ITER_STATS.no_water(1)= ENV_DATA.water_spot;
end