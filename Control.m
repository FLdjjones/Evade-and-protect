function [ CommandSequence ] = Control( GuideSolution )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

N = length(GuideSolution);
velx = 0;
vely = 0;
%velz = 0;
%dx = 100/16; %[ft] 100 ft = 16 pixels
%dt = 1; %[s]
%dv = dx/dt; %[ft/s]

CommandSequence(1,:) = 'SPEEDUP U';
CommandSequence(2,:) = 'DONOTHING';
CommandSequence(3,:) = 'SLOWDWN U';
CmdSeqLength = 3;

for i=1:N-1
    % If next move is North
    if(GuideSolution(i+1,1) < GuideSolution(i,1))
        if(vely > 0)
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'DONOTHING';
        elseif(vely == 0)
            vely = vely + 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP N';
        else
            vely = vely + 2;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP N';
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP N';
        end
        if(velx > 0)
            velx = velx - 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP W';
        elseif(velx < 0)
            velx = velx + 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP E';
        else
            
        end
    end
    
    % If next move is South
    if(GuideSolution(i+1,1) > GuideSolution(i,1))
        if(vely < 0)
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'DONOTHING';
        elseif(vely == 0)
            vely = vely - 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP S';
        else
            vely = vely - 2;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP S';
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP S';
        end
        if(velx > 0)
            velx = velx - 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP W';
        elseif(velx < 0)
            velx = velx + 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP E';
        else
            
        end
    end
    
    % If next move is West
    if(GuideSolution(i+1,2) < GuideSolution(i,2))
        if(velx < 0)
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'DONOTHING';
        elseif(velx == 0)
            velx = velx - 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP W';
        else
            velx = velx - 2;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP W';
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP W';
        end
        if(vely > 0)
            vely = vely - 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP S';
        elseif(vely < 0)
            vely = vely + 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP N';
        else
            
        end
    end
    
    % If next move is East
    if(GuideSolution(i+1,2) > GuideSolution(i,2))
        if(velx > 0)
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'DONOTHING';
        elseif(velx == 0)
            velx = velx + 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP E';
        else
            velx = velx + 2;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP E';
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP E';
        end
        if(vely > 0)
            vely = vely - 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP S';
        elseif(vely < 0)
            vely = vely + 1;
            CmdSeqLength = CmdSeqLength + 1;
            CommandSequence(CmdSeqLength,:) = 'SPEEDUP N';
        else
            
        end
    end
end
           
% 'SPEEDUP N'
% 'SPEEDUP E'
% 'SPEEDUP S'
% 'SPEEDUP W'
% 'SLOWDWN N'
% 'SLOWDWN E'
% 'SLOWDWN S'
% 'SLOWDWN W'
% 'DONOTHING'
% 'SPEEDUP U'
% 'SPEEDUP D'
% 'SLOWDWN U'
% 'SLOWDWN D'

CommandSequence(CmdSeqLength+1,:) = 'SPEEDUP D';
CommandSequence(CmdSeqLength+2,:) = 'DONOTHING';
CommandSequence(CmdSeqLength+3,:) = 'SLOWDWN D';

% CommandSequence(1,:) = 'SPEEDUP U';
% CommandSequence(2,:) = 'DONOTHING';
% CommandSequence(3,:) = 'SLOWDWN U';
% CommandSequence(4,:) = 'DONOTHING';
% CommandSequence(5,:) = 'DONOTHING';
% CommandSequence(6,:) = 'DONOTHING';
% CommandSequence(7,:) = 'DONOTHING';
% CommandSequence(8,:) = 'DONOTHING';
% CommandSequence(9,:) = 'DONOTHING';
% CommandSequence(10,:) = 'SPEEDUP D';
% CommandSequence(11,:) = 'DONOTHING';
% CommandSequence(12,:) = 'SLOWDWN D';

end

