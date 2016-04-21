function [newdirection] = TurnLeft(direction)
newdirection='N';
if direction=='N'
    newdirection='W';
end
if direction=='S'
    newdirection='E';
end
if direction=='W'
    newdirection='S';
end
if direction=='E'
    newdirection='N';
end
% disp('TurnLeft');
end
