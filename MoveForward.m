function [newi,newj] = MoveForward(direction, currenti, currentj)
newi = currenti;
newj = currentj;

if direction=='N'
    newi = currenti -1;
end
if direction=='S'
    newi = currenti +1;
end
if direction=='E'
    newj = currentj +1;
end
if direction=='W'
    newj = currentj -1;
end
end