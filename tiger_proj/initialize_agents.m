function [agent]=initialize_agents(no_tiger,no_deer, no_boar)

    global ENV_DATA PARAM
    env_size=ENV_DATA.size;
%     rng(10);
    %% tiger(gender,position,hunger,thirst,speed,age,fitness,in_territory)
    t_gd = round(rand(no_tiger,1));         % gender of tigers
    t_loc=(env_size-1)*rand(no_tiger,2)+1;      %generate random initial positions for tigers
    t_hg = randi([58,100],no_tiger,1);     % energy of tigers
    t_tr = randi([64,100],no_tiger,1);     % water of tigers   
    t_spd = PARAM.T_SPD;
    t_am = false(no_tiger,1);      % initialize all the tigers' status as not ambush
    t_age = ceil(PARAM.T_MAXAGE* rand(no_tiger,1));    % age of tigers


    %% deer(gender,position,hunger,thirst,speed,age)
    d_gd = round(rand(no_deer,1));         % gender of deer
    d_loc=(env_size-1)*rand(no_deer,2)+1;      %generate random initial positions for deer
    d_hg = randi([96,100],no_deer,1);     % hunger of deer
    d_tr = randi([64,100],no_deer,1);     % thirst of deer
    d_spd = PARAM.D_SPD;
    d_age = ceil(PARAM.D_MAXAGE* rand(no_deer,1));    % age of deer, need to know the life span of a deer 


    %% boar(gender,position,hunger,thirst,speed,age)
    b_gd = round(rand(no_boar,1));         % gender of boar
    b_loc=(env_size-1)*rand(no_boar,2)+1;      %generate random initial positions for boar
    b_hg = randi([96,100],no_boar,1);     % hunger of boar
    b_tr =randi([64,100],no_boar,1);     % thirst of boar
    b_spd = PARAM.B_SPD;
    b_age = ceil(PARAM.B_MAXAGE* rand(no_boar,1));    % age of boar, need to know the life span of a boar 


    %% 
        % Initialise tigers
        for t_i=1:no_tiger
            agent{t_i}=tiger(t_gd(t_i),t_loc(t_i,:),t_hg(t_i),t_tr(t_i),t_spd,t_age(t_i),t_am(t_i));
        end
        % Initialise deer
        for d_i=no_tiger+1:no_tiger+no_deer
            rd_i = d_i-no_tiger;
            agent{d_i}=deer(d_gd(rd_i),d_loc(rd_i,:),d_hg(rd_i),d_tr(rd_i),d_spd,d_age(rd_i));
        end
        % Initialise boar
        for b_i=no_tiger+no_deer+1:no_tiger+no_deer+no_boar
            rb_i = b_i-no_tiger-no_deer;
            agent{b_i}=boar(b_gd(rb_i),b_loc(rb_i,:),b_hg(rb_i),b_tr(rb_i),b_spd,b_age(rb_i));
        end
end
