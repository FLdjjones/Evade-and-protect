function [ GuideSolution ] = GuidanceEP( NavSolution, StartX, StartY, DestX, DestY )
currentx = StartX;
currenty = StartY;
pathlength = 1;
GuideSolution(pathlength,:) = [currentx, currenty];

direction = 'E';

    while(CanMoveForward(direction,currentx,currenty,NavSolution))
      [currentx, currenty] = MoveForward (direction, currentx, currenty);
      pathlength = pathlength + 1;
      GuideSolution(pathlength, : ) = [currentx, currenty];
    end
%     
% while(~(currentx == DestX && currenty == DestY))
% pause(1);

for n = 2:6
while(ShouldMoveForward(direction,currentx,currenty,DestX, DestY, NavSolution)) 
    if(CanMoveRight(direction,currentx,currenty,NavSolution))
     direction = TurnRight(direction);
    if(ShouldMoveForward(direction,currentx,currenty,DestX, DestY, NavSolution)==1)
            while(CanMoveForward(direction,currentx,currenty,NavSolution))
      [currentx, currenty] = MoveForward (direction, currentx, currenty);
      pathlength = pathlength + 1;
      GuideSolution(pathlength, : ) = [currentx, currenty];
            end
    end
 end
  if(CanMoveLeft(direction,currentx,currenty,NavSolution))
     direction = TurnLeft(direction);
    if(ShouldMoveForward(direction,currentx,currenty,DestX, DestY, NavSolution)==1)
            while(CanMoveForward(direction,currentx,currenty,NavSolution))
      [currentx, currenty] = MoveForward (direction, currentx, currenty);
      pathlength = pathlength + 1;
      GuideSolution(pathlength, : ) = [currentx, currenty];
            end
    end
  end
 if(ShouldMoveForward(direction,currentx,currenty,DestX, DestY, NavSolution)==0)
    direction = TurnRight(direction);
end
end
n=n+1;
end



