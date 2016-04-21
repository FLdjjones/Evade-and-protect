function [decision] = CanMoveLeft(direction,currenti,currentj,matrix)
direction = TurnLeft(direction);
[newi,newj] = MoveForward(direction,currenti,currentj);
[n,m] = size(matrix);
decision = true;
if(newi < 1 || newi > n)
    decision = false;
end
if(newj < 1 || newj > m)
    decision = false;
end
if(decision == true)
    if(matrix(newi,newj) ~= 0)
        decision = true;
    else
        decision = false;
    end
end
end