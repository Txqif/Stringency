function xyplot(obj,varargin)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
 
    figure
    plot(obj.C,obj.I)
    xlabel('C')
    ylabel('I')
    title(obj.name)
    grid on
end

