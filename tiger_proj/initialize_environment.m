function initialize_environment(size,num_pool)

%function that populates the global data structure representing
%environmental information

%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.size - length of environment edge in km
   %    ENV_DATA.food is  a size x size array containing distribution of food

    global ENV_DATA

    ENV_DATA.shape='square';
    ENV_DATA.units='kilometres';
    ENV_DATA.size=size;
    ENV_DATA.water_spot=num_pool;
    ENV_DATA.food=floor(5000*ones(size,size));        %distribute food in km x km squares 
    ENV_DATA.pool_center=size*rand(num_pool,2); 
    ENV_DATA.active_pool_center=true(num_pool,1);
    ENV_DATA.water = zeros(ENV_DATA.size);
    ENV_DATA.is_water = false(ENV_DATA.size);

    for i=1:num_pool

        center=ENV_DATA.pool_center(i,:);
        center = ceil(center);

        ENV_DATA.water(center(1):center(1),center(2):center(2))=100;
        ENV_DATA.food(center(1):center(1),center(2):center(2))=0;
        ENV_DATA.is_water(center(1):center(1),center(2):center(2))=1;
    end


end
