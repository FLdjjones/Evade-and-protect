function [ GuideSolution ] = Guidance ( NavSolution, StartX, StartY, DestX, DestY )
currentx = StartX;
currenty = StartY;
pathlength = 1;
GuideSolution(pathlength,:) = [currentx, currenty]

direction = 'S';
while(CanMoveForward(direction,currentx,currenty,NavSolution))
      [currentx, currenty] = MoveForward (direction, currentx, currenty);
      pathlength = pathlength + 1;
      GuideSolution(pathlength, : ) = [currentx, currenty];
end

direction = TurnLeft(direction);

while(~(currentx == DestX && currenty == DestY))
    if(CanMoveRight(direction,currentx,currenty,NavSolution))
        direction = TurnRight(direction);
        [currentx,currenty] = MoveForward(direction,currentx,currenty);
        pathlength = pathlength + 1;
        GuideSolution(pathlength,:) = [currentx,currenty];
    elseif(CanMoveForward(direction,currentx,currenty,NavSolution))
         [currentx,currenty] = MoveForward(direction,currentx,currenty);
         pathlength = pathlength + 1;
        GuideSolution(pathlength,:) = [currentx,currenty];
    elseif(CanMoveLeft(direction,currentx,currenty,NavSolution))
        direction = TurnLeft(direction);
        [currentx,currenty] = MoveForward(direction,currentx,currenty);
         pathlength = pathlength + 1;
         GuideSolution(pathlength,:) = [currentx,currenty];
    else
        direction = TurnLeft(direction);
        direction = TurnLeft(direction);
        [currentx,currenty] = MoveForward(direction,currentx,currenty);
        pathlength = pathlength+1
        GuideSolution(pathlength, :) = [currentx,currenty];
    end
end












%
% direction = TurnLeft(direction)
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end  
% 
% direction = 'E'
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%       [currentx, currenty] = MoveForward (direction, currentx, currenty);
%       pathlength = pathlength + 1;
%       GuideSolution(pathlength, : ) = [currentx, currenty];
% end
% 
% direction = TurnLeft(direction)
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end  
% 
% direction = 'E'
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%       [currentx, currenty] = MoveForward (direction, currentx, currenty);
%       pathlength = pathlength + 1;
%       GuideSolution(pathlength, : ) = [currentx, currenty];
% end
% 
% direction = TurnRight(direction)
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% 
% direction = 'S'
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%       [currentx, currenty] = MoveForward (direction, currentx, currenty);
%       pathlength = pathlength + 1;
%       GuideSolution(pathlength, : ) = [currentx, currenty];
% end
% 
% direction = TurnRight(direction)
% while(~CanMoveLeft(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end  
% 
%  direction = 'W'
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end  


% % % % % % % % % % % % % % % % % % % % 



% 
% direction = 'N';
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%       [currentx, currenty] = MoveForward (direction, currentx, currenty);
%       pathlength = pathlength + 1;
%       GuideSolution(pathlength, : ) = [currentx, currenty];
% end
% 
% 
% 
% direction = 'S';
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%       [currentx, currenty] = MoveForward (direction, currentx, currenty);
%       pathlength = pathlength + 1;
%       GuideSolution(pathlength, : ) = [currentx, currenty];
% end
% 
% direction = 'W';
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%       [currentx, currenty] = MoveForward (direction, currentx, currenty);
%       pathlength = pathlength + 1;
%       GuideSolution(pathlength, : ) = [currentx, currenty];
% end
% 
% 
% direction = TurnRight(direction)
% while(~CanMoveLeft(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% direction = TurnLeft(direction)
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 






% %  direction = 'N';
% %       [currentx, currenty] = MoveForward (direction, currentx, currenty);
% %       pathlength = pathlength + 1;
% %       GuideSolution(pathlength, : ) = [currentx, currenty];
% direction = 'N';
% % while(currentx ~= DestX)
% %     [currentx, currenty] = MoveForward(direction,currentx,currenty);
% %     pathlength = pathlength+1
% %     GideSolution(pathlength, :) = [currentx,currenty]
% % end
%     while(CanMoveForward(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% direction = TurnLeft(direction);
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% direction = TurnRight(direction);
% % while(~CanMoveLeft(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% % end
% 
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% 
% 
% direction = 'E';
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% direction = TurnLeft(direction);
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% direction = TurnRight(direction);
% % while(~CanMoveLeft(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% % end
% 
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% % direction  = 'W';
% % while(CanMoveForward(direction, currentx, currenty, NavSolution))
% %     [currentx, currenty] = MoveForward(direction,currentx,currenty);
% %     pathlength =  pathlength+1
% %     GuideSolution(pathlength, :) = [currentx, currenty]
% % end
% 
% direction = 'S' 
% while(CanMoveForward(direction, currentx, currenty, NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end

% 
% direction = 'W'
% while(CanMoveForward(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% direction = TurnLeft(direction);
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% direction = TurnRight(direction);
% % while(~CanMoveLeft(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% % end
% 
% while(~CanMoveRight(direction,currentx,currenty,NavSolution))
%     [currentx, currenty] = MoveForward(direction,currentx,currenty);
%     pathlength =  pathlength+1
%     GuideSolution(pathlength, :) = [currentx, currenty]
% end
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% %direction = 'N'
% % for i = 1 :10
% %      [currentx, currenty] = MoveForward (direction, currentx, currenty);
% %      pathlength = pathlength + 1;
% %      GuideSolution(pathlength, : ) = [currentx, currenty];
% 
% % code moves to destination but does not avoid walls
% %  while(currentx ~= DestX)
% %     [currentx, currenty] = MoveForward (direction, currentx, currenty);
% %     pathlength = pathlength + 1;
% %     GuideSolution(pathlength, : ) = [currentx, currenty];
% % end
% % direction = 'N'
% % while(currentx ~= DestX)
% %     [currentx, currenty] = MoveForward (direction, currentx, currenty);
% %     pathlength = pathlength + 1;
% %     GuideSolution(pathlength, : ) = [currentx, currenty];
% % end
% % 
% % direction = 'E';
% % while (currenty ~= DestY)
% %     [currentx, currenty] = MoveForward (direction, currentx, currenty);
% %     pathlength = pathlength + 1;
% %     GuideSolution(pathlength, : ) = [currentx, currenty];
% % end