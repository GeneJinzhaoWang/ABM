function val=get(c,property)

%standard function to allow extraction of memory parameters from deer object

switch property
   
    case 'gender'
       val=c.gender;
    case 'position'
       val=c.position;
    case 'energy'
        val=c.energy;
    case 'water'
         val=c.water;
    case 'age'
         val=c.age;
    otherwise 
       error('invalid field name')
end

