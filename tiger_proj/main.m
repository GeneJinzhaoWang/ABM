function main(env_size,num_pool,no_tiger,no_deer, no_boar, no_iters)
%main(env_size,no_tiger,no_deer, no_boar, no_iters)

%env_size = size of model environmnet in km (sugested value for plotting
%purposes =50)
%num_pool - number of pools
%no_tiger - initial number of tiger agents
%no_deer - initial number of deer agents
%no_boar - initial number of boar agents
%no_iters - number of iterations required

%definition of global variables:
%NO_IT - current iteration number
%ITER_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc). iniitialised in initialize_results.m
%ENV_DATA - data structure representing the environment (initialised in
%initialize_environment.m)

    %clear any global variables/ close figures from previous simulations
    clear global
    close all
    
    global  NO_IT   

    %MODEL INITIALISATION
    initialize_parameters
    initialize_environment(env_size, num_pool);
    [agents]=initialize_agents(no_tiger,no_deer, no_boar);
    initialize_messages(agents)
    initialize_result(no_tiger,no_deer, no_boar,no_iters)
    
    for iter=1:no_iters
        NO_IT = iter;
        disp(num2str(NO_IT));
        update_environment;
        visualization;
        agents = agent_action(agents);
    end
    
end