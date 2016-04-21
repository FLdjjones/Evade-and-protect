function [newdirection] = TurnRight(direction)
newdirection='N';
if direction=='N'
    newdirection='E';
end
if direction=='S'
    newdirection='W';
end
if direction=='W'
    newdirection='N';
end
if direction=='E'
    newdirection='S';
end
% disp('TurnRight');
end
