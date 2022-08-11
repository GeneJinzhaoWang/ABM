tic
pools = [5;10;15;20;25;30;35;40;45;50];
global_repeat = 10;
env_size = 10;
no_tiger = 8;
no_deer = 3500;
no_boar = 1000;
nsteps = 4320; %one year
data_cell = cell(length(pools),global_repeat);
dat_1 = {};
dat = struct('died_tiger',[zeros(1,nsteps+1)],...			%no. agents dying per iteration
                'died_deer',[zeros(1,nsteps+1)],...	
                'died_boar',[zeros(1,nsteps+1)],...
                'eaten',[zeros(1,nsteps+1)],...              %no. of prey eaten per iteration                                                 
                'tot',[zeros(1,nsteps+1)],...				%total no. agents in model per iteration
                'tot_tiger',[zeros(1,nsteps+1)],...             % total no. tiger
                'tot_deer',[zeros(1,nsteps+1)],...             % total no. deer
                'tot_boar',[zeros(1,nsteps+1)],...             % total no. boar
                'tfood',[zeros(1,nsteps+1)],...               %remaining vegetation level
                'no_water',[zeros(1,nsteps+1)]);
dat_2=repmat(dat,1,length(pools));

for j = 1:length(pools)
    num_pool = pools(j);
    temp_cell = cell(1,global_repeat);
    parfor repeat =1:global_repeat
        ITER_STATS=main(env_size,num_pool,no_tiger,no_deer, no_boar, nsteps);
        temp_cell{1,repeat} = ITER_STATS;
    end
    for repeat=1:global_repeat
        data_cell{j,repeat} = temp_cell{1,repeat};
    end
end

for i =1:length(pools)
    for repeat =1:global_repeat
        coef = 1/global_repeat;
        sg_cell = data_cell{i,repeat};
        dat_2(i).died_tiger = dat_2(i).died_tiger +coef*sg_cell.died_tiger;
        dat_2(i).died_deer = dat_2(i).died_deer + coef*sg_cell.died_deer;
        dat_2(i).died_boar = dat_2(i).died_boar + coef*sg_cell.died_boar;
        dat_2(i).tot = dat_2(i).tot +coef*sg_cell.tot;
        dat_2(i).tot_tiger = dat_2(i).tot_tiger + coef*sg_cell.tot_tiger;
        dat_2(i).tot_deer = dat_2(i).tot_deer + coef*sg_cell.tot_deer;
        dat_2(i).tot_boar = dat_2(i).tot_boar + coef*sg_cell.tot_boar;
        dat_2(i).tfood = dat_2(i).tfood + coef*sg_cell.tfood;
        dat_2(i).no_water = dat_2(i).no_water + coef*sg_cell.no_water;
    end
    
end
save data_5_10_15_20_25_30_35_40_45_50.mat dat_2
toc

