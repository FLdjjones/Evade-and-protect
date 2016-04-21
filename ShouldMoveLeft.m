function [ decison ] = ShouldMoveLeft(direction,currentx,currenty,DestX, DestY )
direction = TurnLeft(direction);
disp('Should i turn left?');
decison = true;
if(ShouldMoveForward(direction,currentx,currenty,DestX, DestY)==true)
    decison = true;
    disp('i should go left');
else
    decison = false;
    disp('i should not go left');
end
end

