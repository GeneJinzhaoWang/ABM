function initialize_messages(agent)

%function that populates the global data structure representing
%message information

%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=tiger, 2=deer, 3=boar, 0=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died
   %    in the current iteration
   
 global MESSAGES
 
 for agent_i=1:length(agent)
     if isa(agent{agent_i},'tiger')
        MESSAGES.atype(agent_i)=1;
        MESSAGES.position(agent_i,:)=get(agent{agent_i},'position');
     elseif isa(agent{agent_i},'deer')
        MESSAGES.atype(agent_i)=2;
        MESSAGES.position(agent_i,:)=get(agent{agent_i},'position');
     elseif isa(agent{agent_i},'boar')
        MESSAGES.atype(agent_i)=3;
        MESSAGES.position(agent_i,:)=get(agent{agent_i},'position');   
     else
        MESSAGES.atype(agent_i)=0; 
        MESSAGES.position(agent_i,:)=[-1 -1];
     end
     MESSAGES.dead(agent_i)=0;
     MESSAGES.targeted(agent_i)=0;
     MESSAGES.thirst(agent_i)=0;
     MESSAGES.hunger(agent_i)=0;
 end