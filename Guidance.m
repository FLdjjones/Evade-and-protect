function [ GuideSolution ] = GuidanceEP( NavSolution, StartX, StartY, DestX, DestY )
currentx = StartX;
currenty = StartY;

pathlength = 1;
GuideSolution(pathlength,:) = [currentx, currenty];

% Begins by moving out of spawn
direction = 'E';
while(CanMoveForward(direction,currentx,currenty,NavSolution))
      [currentx, currenty] = MoveForward (direction, currentx, currenty);
      pathlength = pathlength + 1;
      GuideSolution(pathlength, : ) = [currentx, currenty];
      disp('out of spawn');
end 
%while loop for running untill you meet the destination (which should never happen)
for i = 1:300
    
if(ShouldMoveForward(direction,currentx,currenty,DestX,DestY) == true)
     if(CanMoveForward(direction,currentx,currenty,NavSolution) == true)
        [currentx, currenty] = MoveForward (direction, currentx, currenty);
        pathlength = pathlength + 1;
        GuideSolution(pathlength, : ) = [currentx, currenty];
    elseif(CanMoveForward(direction,currentx,currenty,NavSolution) == false )  
         if(ShouldMoveLeft(direction,currentx,currenty,DestX, DestY)==true) 
            if(CanMoveLeft(direction,currentx,currenty,NavSolution))
                direction = TurnLeft(direction);
                disp('turning to the left now');
            else
                disp('can not turn left');
            end
        elseif(ShouldMoveRight(direction,currentx,currenty,DestX, DestY)==true)
            if(CanMoveRight(direction,currentx,currenty,NavSolution))
                 direction = TurnRight(direction);
                 disp('turning to the right now');
            else
                disp('can not turn right');
            end
       else
         direction = TurnRight(direction);
         direction = TurnRight(direction);
         end
     else
         end
else
    if(ShouldMoveLeft(direction,currentx,currenty,DestX, DestY)==true) 
            if(CanMoveLeft(direction,currentx,currenty,NavSolution))
                direction = TurnLeft(direction);
                disp('turning to the left now');
            else
                disp('can not turn left');
            end
        elseif(ShouldMoveRight(direction,currentx,currenty,DestX, DestY)==true)
            if(CanMoveRight(direction,currentx,currenty,NavSolution))
                 direction = TurnRight(direction);
                 disp('turning to the right now');
            else
                disp('can not turn right');
            end
       else
         direction = TurnRight(direction);
         direction = TurnRight(direction);
         end
end
end
end
 
