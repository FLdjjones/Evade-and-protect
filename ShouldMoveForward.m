function [decision] = ShouldMoveForward(direction,currentx,currenty,DestX, DestY)
[newi,newj] = MoveForward(direction,currentx,currenty);
% [n,m] = size(matrix);
% oldDtoX= DestX-currentx;
% oldDtoY= DestY-currenty;
% newDtoX= DestX - newi;
% newDtoY= DestY - newj;
newlength = sqrt((DestX- newi)^2 + (DestY -newj)^2);
oldlength = sqrt((DestX- currentx)^2 + (DestY -currenty)^2);
decision =false;
if( oldlength > newlength)
    decision = false;
    disp('oh no i cant go forward enemy that way');
elseif(newlength >= oldlength)
    decision = true;
    disp('forward is clear');
end


