function [ NavSolution ] = Navigation( RawNavData )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

imagedata = imread(RawNavData);
[n,m,p] = size(imagedata);

NavSolution = zeros(n,m);

for i=1:n
    for j=1:m
        if(imagedata(i,j,1) >= 245 && imagedata(i,j,2) >= 245 && imagedata(i,j,3) >= 245)
            NavSolution(i,j) = 1;
        else
            NavSolution(i,j) = 0;
        end
    end
end

end

