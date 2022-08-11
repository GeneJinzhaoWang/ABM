classdef tiger
    % Summary of Tiger class goes here
    
    properties         %define tiger properties (parameters) 
        gender;         % Gender, 1 stands for male and 0 stands for female
        position;       % Position of the Tiger
        energy;         % enery percentage, from 0%-100%. 0% will starve to death
        water;          % water Percentage, from 0%-100%. 0% will thirst to death
        speed;          % Speed Level, unit: km/h
        age;            % age in years
        ambush          % Are tiger ambushing their prey. Trure stands for yes.
                        % The probability of catching prey will be 100%.
    end
    
    methods
        function obj = tiger(gender,position,energy,water,speed,age,ambush)
            %  Construct an instance of tiger class
            if gender == 0
                obj.gender = 'female';
            elseif gender == 1
                obj.gender = 'male';
            else
                error('Input gender for tiger is incorrect')
            end
            
            obj.position = position;
            obj.energy = energy;
            obj.water = water;
            obj.speed = speed;
            obj.age = age;
            obj.ambush = ambush;

        end
    end
end
