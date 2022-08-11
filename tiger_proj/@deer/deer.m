classdef deer
    %   DEER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        gender;         % Gender, 1 stands for male and 0 stands for female
        position;       % Position of the deer
        energy;         % Hunger percentage, from 0%-100%. 0% will starve to death
        water;         % Thrist Percentage, from 0%-100%. 0% will thirst to death
        speed;          % Speed Level, unit: km/h
        age;            % age in years
    end
    
    methods
        function obj = deer(gender,position,energy,water,speed,age)
            %DEER Construct an instance of this class
            %   Detailed explanation goes here
            if gender == 0
                obj.gender = 'female';
            elseif gender == 1
                obj.gender = 'male';
            else
                error('Input gender for deer is incorrect')
            end

            obj.position = position;
            obj.energy = energy;
            obj.water = water;
            obj.speed = speed;
            obj.age = age;
        end
    end
end

