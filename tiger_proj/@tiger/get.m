function val = get(agent,property)
%GET_INFO Summary of this function goes here
%   Detailed explanation goes here
switch property
   
case 'gender'
   val=agent.gender;
case 'position'
   val=agent.position;
case 'energy'
    val=agent.energy;
case 'water'
     val=agent.water;
case 'age'
     val=agent.age;
case 'ambush'
     val=agent.ambush; 
otherwise 
   error('invalid field name')
end

