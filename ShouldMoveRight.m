function [ decison ] = ShouldMoveRight(direction,currentx,currenty,DestX, DestY)
direction = TurnRight(direction);
decison = true;
disp('should i turn right?');
if(ShouldMoveForward(direction,currentx,currenty,DestX, DestY) == true)
    decison= true;
    disp('i should turn Right');
else
    decison = false;
    disp('i should not turn right')
end
end
