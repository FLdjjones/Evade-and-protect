function DroneSim
% DroneSim     Physical simulation to test EGN 1935 GNC Design Project
%    The DroneSim interface allows students to test their personal
%    Guidance, Navigation, and Control functions for the Spring 2015
%    Design Project

clear all;
close all;
tstart = tic;

% Initialize the figure.
f = figure('Visible','off',...%'MenuBar','none',...
    'NumberTitle','off',... %'Color','w',...
    'Name','DroneSim: Testing','Position',[50,50,1100,600]);

% Create the figure components
hrun = uicontrol('Style','pushbutton','String','Run',...
    'Position',[950,220,70,25],...
    'Callback',{@run_button_Callback});
hsave = uicontrol('Style','pushbutton','String','Save',...
    'Position',[950,190,70,25]);
hcase = uicontrol('Style','popupmenu',...
    'String',{'Test Case 1','Test Case 2','Test Case 3','Test Case 4','Test Case 5','Test Case 6','All Cases'},...
    'Position',[950,250,90,25],...
    'Callback',{@popup_menu_Callback});
% hsolution = uicontrol('Style','popupmenu',...
%     'String',{'Default','User Defined'},...
%     'Position',[950,280,90,25]);
hscore = uicontrol('Style','text','String','000',...
    'FontSize',24,...
    'Position',[950,120,140,35]);
hscoretext = uicontrol('Style','text','String','Score:',...
    'Position',[950,160,50,20]);

hraw = axes('Units','pixels','Position',[50,360,200,185]);
hpathplot = axes('Units','pixels','Position',[50,60,200,185]);
hanimation = axes('Units','pixels','Position',[300,60,500,500]);
hanimationz = axes('Units','pixels','Position',[850,60,50,500]);

movegui(f,'center');

set(f,'Visible','on');

% A = imread('test1.bmp');
% axes(hraw);
% image(A);
% axes(hpathplot);
% image(A);
% B = imresize(A,4);
% axes(hanimation);
% image(B);
% xlim([1,32]);
% ylim([1,32]);
% pause(1.0);

score = 0;
SensorDataFilename = 'DS_test1.bmp';
StartX = 73;
StartY = 1;
DestX = 30;
DestY = 128;
run_once = true;

% SensorDataFilename = 'test2.bmp';
% StartX = 7;
% StartY = 1;
% DestX = 64;
% DestY = 98;

% SensorDataFilename = 'test3.bmp';
% StartX = 18;
% StartY = 1;
% DestX = 20;
% DestY = 110;

% SensorDataFilename = 'test3.bmp';
% StartX = 1;
% StartY = 40;
% DestX = 94;
% DestY = 38;

% SensorDataFilename = 'test4.bmp';
% StartX = 41;
% StartY = 90;
% DestX = 84;
% DestY = 1;

% SensorDataFilename = 'test5.bmp';
% StartX = 62;
% StartY = 115;
% DestX = 20;
% DestY = 1;





% ------------


% for(i=1:1:(512-32))
%     xlim([i,i+32]);
%     ylim([i,i+32]);
%     pause(0.002);
% end



function popup_menu_Callback(source,eventdata)
    % Determine the selected data set.
    str = get(source,'String');
    val = get(source,'Value');
    % Set current data to the selected data set.
    switch str{val}
    case 'Test Case 1'
        SensorDataFilename = 'DS_test1.bmp';
        StartX = 73;
        StartY = 1;
        DestX = 30;
        DestY = 128;
        score = 0;
        run_once = true;
    case 'Test Case 2' 
        SensorDataFilename = 'DS_test2.bmp';
        StartX = 7;
        StartY = 1;
        DestX = 64;
        DestY = 98;
        score = 0;
        run_once = true;
    case 'Test Case 3' 
        SensorDataFilename = 'DS_test3.bmp';
        StartX = 18;
        StartY = 1;
        DestX = 20;
        DestY = 110;
        score = 0;
        run_once = true;
    case 'Test Case 4' 
        SensorDataFilename = 'DS_test3.bmp';
        StartX = 1;
        StartY = 40;
        DestX = 94;
        DestY = 38;
        score = 0;
        run_once = true;
    case 'Test Case 5' 
        SensorDataFilename = 'DS_test4.bmp';
        StartX = 41;
        StartY = 90;
        DestX = 84;
        DestY = 1;
        score = 0;
        run_once = true;
    case 'Test Case 6' 
        SensorDataFilename = 'DS_test5.bmp';
        StartX = 62;
        StartY = 115;
        DestX = 20;
        DestY = 1;
        score = 0;
        run_once = true;
    case 'All Cases' 
        score = 0;
        run_once = false;
        
    end
end

function run_button_Callback(source,eventdata)
% Display surf plot of the currently selected data.
if(run_once)
    score = 0;
    RunSimulation;
else
    score = 0;
    SensorDataFilename = 'DS_test1.bmp';
        StartX = 73;
        StartY = 1;
        DestX = 30;
        DestY = 128;
        RunSimulation;
        
        SensorDataFilename = 'DS_test2.bmp';
        StartX = 7;
        StartY = 1;
        DestX = 64;
        DestY = 98;
        
        RunSimulation;
        SensorDataFilename = 'DS_test3.bmp';
        StartX = 18;
        StartY = 1;
        DestX = 20;
        DestY = 110;
         RunSimulation;
        SensorDataFilename = 'DS_test3.bmp';
        StartX = 1;
        StartY = 40;
        DestX = 94;
        DestY = 38;
        RunSimulation;
        
        SensorDataFilename = 'DS_test4.bmp';
        StartX = 41;
        StartY = 90;
        DestX = 84;
        DestY = 1;
        
        RunSimulation;
   
        SensorDataFilename = 'DS_test5.bmp';
        StartX = 62;
        StartY = 115;
        DestX = 20;
        DestY = 1;
        RunSimulation;
        
end
end

function RunSimulation

SensorData = imread(SensorDataFilename);
NavigationSolution = Navigation(SensorDataFilename);

[m1,n1,p1] = size(SensorData);
[m2,n2,p2] = size(NavigationSolution);
if(m1 == m2)
    score = score + 50;
end
if(n1 == n2)
    score = score + 50;
end
if(p2 == 1)
    score = score + 50;
end
GuidanceSolution = Guidance(NavigationSolution,StartX,StartY,DestX,DestY);
[m3,n3,p3] = size(GuidanceSolution);
if(n3 == 2)
    score = score + 50;
end
if(GuidanceSolution(1,:) == [StartX,StartY] & GuidanceSolution(m3,:) == [DestX,DestY])
    score = score + 1000 - (1000-500)/(1000-128)*(m3-128);
end
axes(hraw);
image(SensorData);
title('Raw Sensor Data');
xlabel('Pixel coordinates');

NavigationImage(:,:,1) = double(NavigationSolution); 
NavigationImage(:,:,2) = double(NavigationSolution);
NavigationImage(:,:,3) = double(NavigationSolution);
N = length(GuidanceSolution);
for i=1:N
    NavigationImage(GuidanceSolution(i,1),GuidanceSolution(i,2),1) = 0.0;
    NavigationImage(GuidanceSolution(i,1),GuidanceSolution(i,2),2) = 1.0;
    NavigationImage(GuidanceSolution(i,1),GuidanceSolution(i,2),3) = 0.0;
end
NavigationImage(GuidanceSolution(1,1),GuidanceSolution(1,2),1) = 0.0;
NavigationImage(GuidanceSolution(1,1),GuidanceSolution(1,2),2) = 0.0;
NavigationImage(GuidanceSolution(1,1),GuidanceSolution(1,2),3) = 1.0;
NavigationImage(GuidanceSolution(N,1),GuidanceSolution(N,2),1) = 1.0;
NavigationImage(GuidanceSolution(N,1),GuidanceSolution(N,2),2) = 0.0;
NavigationImage(GuidanceSolution(N,1),GuidanceSolution(N,2),3) = 0.0;

axes(hpathplot);
image(NavigationImage);
title('Navigation/Guidance Data');
xlabel('Pixel coordinates');

ControlSolution = Control(GuidanceSolution);
[m4,n4,p4] = size(ControlSolution);
set(hscore,'String',num2str(score));
[M,junk] = size(ControlSolution);

% ------------
% Physics Simulation
win = 31;
Environment = imresize(SensorData,5,'nearest');
[n,m,p] = size(Environment);
Environment2 = 0.5*ones(n+(win-1)*2,m+(win-1)*2,3);
Environment2(win:win+n-1,win:win+m-1,:) = double(Environment)/255.0;
%PStartX = StartX*4;
axes(hanimation);
image(Environment2);
title('Map of Physical Space');
xlabel('Physical coordinates');
axes(hanimationz);
title('Altitude');
xlabel('Physical coordinates');
plot([0,5],[15,15],'r',[0,5],[7,7],'r',2.5,0,'bo');
%rectangle('Position',[2.25,0,0.5,0.5],'EdgeColor','b','FaceColor','b')
xlim([0,5]);
ylim([0,20]);


VZ = 0;
PZ = 0;
VX = 0;
PX = floor((StartY-1)/16*100);
VY = 0;
PY = floor((128-StartX)/16*100);
time = M*10;
for i=1:1:time %for i=1:1:time
    if(mod(i,10) == 1)
        if(ControlSolution(floor(i/10)+1,:) == 'SPEEDUP U')
            VZ = VZ + 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SLOWDWN U')
            VZ = VZ - 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SPEEDUP D')
            VZ = VZ - 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SLOWDWN D')
            VZ = VZ + 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SPEEDUP N')
            VY = VY + 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SLOWDWN N')
            VY = VY - 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SPEEDUP S')
            VY = VY - 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SLOWDWN S')
            VY = VY + 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SPEEDUP W')
            VX = VX - 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SLOWDWN W')
            VX = VX + 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SPEEDUP E')
            VX = VX + 6.25;
        elseif(ControlSolution(floor(i/10)+1,:) == 'SLOWDWN E')
            VX = VX - 6.25;
        else
            ;
        end
    end
    PZ = PZ + VZ*1.0/10.0;
    PX = PX + VX*1.0/10.0;
    PY = PY + VY*1.0/10.0;
    path(i,:) = [PX,PY,PZ];
%     axes(hanimation);
%     PixX = (floor(16*PX/100+1)*5-2)+win-1;
%     PixY = (floor(128-16*PY/100)*5-2)+win-1;
%     %image(Environment2);
%     xlim([PixX-floor(win/2),PixX+floor(win/2)]);
%     ylim([PixY-floor(win/2),PixY+floor(win/2)]); 
%     axes(hanimationz);
%     plot(hanimationz,[0,5],[15,15],'r',[0,5],[7,7],'r');
%     rectangle('Position',[2.25,PZ,0.5,0.5],'EdgeColor','b','FaceColor','b')
%     xlim([0,5]);
%     ylim([0,20]);    
    %pause(0.001);
end
            
telapsed = toc(tstart);
axes(hanimation)
title('Map of Physical Space');
xlabel('Physical coordinates')
%plot3(path(:,1),path(:,2),path(:,3))

a=min(path(:,1));b=max(path(:,1));c=min(path(:,2));d=max(path(:,2));
for i=1:100:time
    plot(hanimation,path(i,1),path(i,2),'bo',path(:,1),path(:,2),'b-')
    xlim(hanimation,[a,b]);
    ylim(hanimation,[c,d]);
    title(hanimation,'Map of Physical Space');
    xlabel(hanimation,'Physical coordinates');
    plot(hanimationz,[0,5],[15,15],'r',[0,5],[7,7],'r',2.5,path(i,3),'bo')
    xlim(hanimationz,[0,5]);
    ylim(hanimationz,[0,20]);
    title(hanimationz,'Map of Physical Space');
    xlabel(hanimationz,'Physical coordinates');
    
    pause(0.001)
end
plot(hanimationz,[0,5],[15,15],'r',[0,5],[7,7],'r',2.5,path(time,3),'bo')
    xlim(hanimationz,[0,5]);
    ylim(hanimationz,[0,20]);
    
    
end


end









