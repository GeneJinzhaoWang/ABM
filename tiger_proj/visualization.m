function  visualization
%VISUALIZATION Summary of this function goes here
%   Detailed explanation goes here
    global ENV_DATA MESSAGES ITER_STATS NO_IT
    
    
    typ=MESSAGES.atype;                                         %extract types of all agents
    live_agent =typ>0;
    pos = MESSAGES.position(live_agent,:);
    species = typ(live_agent);
    grids = ENV_DATA.size+1;
    
   

        %%%%%%%%%%%%%
% plot the line graph of agents and remaining water and food
% nt - number of tiger
% nd - number of deer
% nb - number of boar
% NO_IT is current iteration number
% t_food is total food
% n_water is number of active water pool

    f1 = figure(1);
    
    nt = ITER_STATS.tot_tiger;
    nd = ITER_STATS.tot_deer;
    nb = ITER_STATS.tot_boar;
    t_food = ITER_STATS.tfood;   %total food remaining
    n_water = ITER_STATS.no_water;  %number of active water pool 
    t_agt_n = nt(NO_IT+1) + nd(NO_IT+1) + nb(NO_IT+1);
    
    
    subplot(4,1,1),plot((1: NO_IT+1),nt(1: NO_IT+1),'r');
    subplot(4,1,1),axis([0 NO_IT 0 1.1*max(nt)]);
    subplot(4,1,1),title('Number of live tigers');
    
    subplot(4,1,2),plot((1: NO_IT+1),nd(1: NO_IT+1),'c');
    subplot(4,1,2),axis([0 NO_IT 0 1.1*max(nd)]);
    subplot(4,1,2),title('Number of live deers');
    
    subplot(4,1,3),plot((1: NO_IT+1),nb(1: NO_IT+1),'m');
    subplot(4,1,3),axis([0 NO_IT 0 1.1*max(nb)]);
    subplot(4,1,3),title('Number of live boars');
    
    subplot(4,1,4),plot((1: NO_IT+1),n_water(1:NO_IT+1),'b');
    subplot(4,1,4),axis([0 NO_IT 0 n_water(1)]);
    subplot(4,1,4),title('total active water pool ');
    drawnow



    
    f2 = figure(2);
    clf
    set(f2,'Units','Normalized');
    x = (0:ENV_DATA.size) ;
    y = x;
    [X,Y] = meshgrid(x,y);
    Z = zeros(grids,grids);
    xlim([0 ENV_DATA.size]);
    ylim([0 ENV_DATA.size]);
    
 %     Food and Water

    colormap_food(:,:,1)=ones(grids).*linspace(1,0,grids);
    colormap_food(:,:,2)=ones(grids).*linspace(1,0.5,grids);
    colormap_food(:,:,3)=zeros(grids);
    
    colormap_water(:,:,1)=ones(grids).*linspace(1,0,grids);
    colormap_water(:,:,2)=zeros(grids);
    colormap_water(:,:,3)=ones(grids).*linspace(0,1,grids);
    
    current_colormap=zeros(grids,grids,3);

    for i =1:ENV_DATA.size
        for j=1:ENV_DATA.size
            is_water = ENV_DATA.is_water(i,j);
            if is_water
                c_water = min(ENV_DATA.water(i,j)+1,ENV_DATA.size);
                current_colormap(j,i,:) = colormap_water(c_water,c_water,:);
                
                
            else
                c_food = min(ceil(ENV_DATA.food(i,j)/5+1),ENV_DATA.size);
                current_colormap(j,i,:) = colormap_food(c_food,c_food,:);
            end
            
        end
    end
    


    hold on;
    
    surf(X,Y,Z,current_colormap);
    view(45,45)
    hold on
    axis off
    
    for cn=1:length(species)                          %cycle through each agent in turn
        this_species = species(cn);
        if this_species == 1
            pos_ = pos(cn,:);
            plot(pos_(1),pos_(2),'r*','MarkerSize',20);
        
        elseif this_species == 2

            pos_ = pos(cn,:);
            plot(pos_(1),pos_(2),'c.','MarkerSize',20);
            
        elseif this_species == 3
            pos_ = pos(cn,:);
            plot(pos_(1),pos_(2),'m.','MarkerSize',20);
        end
    end
    
    axis off
    axis equal
    set(gcf,'color',[1 1 1]);
    
    uicontrol(f2,'Style','pushbutton',...
                  'String','PAUSE',...
                  'Position',[20 20 60 20], ...
                  'Callback', 'global ENV_DATA; ENV_DATA.pause=true; display(ENV_DATA.pause); clear ENV_DATA;');  

    uicontrol(f2,'Style','pushbutton',...
                   'String','RESUME',...
                   'Position',[100 20 60 20], ...
                   'Callback', 'global ENV_DATA; ENV_DATA.pause=false; clear ENV_DATA;'); 
    
    axis off          
    title(['Iteration no.= ' num2str(NO_IT) '.  No. agents = ' num2str(t_agt_n)]);
    axis off

    
    
end

