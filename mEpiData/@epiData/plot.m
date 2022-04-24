function plot(obj,varargin)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    opt = [];
    figure
    for n = 1:2:length(varargin)
        if isempty(varargin{n+1})
            continue
        end
        switch lower(varargin{n})
            case 'opt'
                opt = varargin{n+1};
            case 'what'
                switch lower(varargin{n+1})
                    case 'c'
                        x = obj.dates;
                        y = obj.C;
                        ylab = 'C';
                    case 'i'
                        x = obj.dates;
                        y = obj.I;
                        ylab = 'I';
                end
        end
    end
    if isempty(opt)
        opt = options();
    end
    if isempty(opt.plot_type)
        opt.plot_type = 'bar';
    end
    if isempty(opt.scale)
        opt.scale = 'linear';
    end
    if isempty(opt.ylab)
        opt.ylab = ylab;
    end

    switch opt.plot_type
        case 'bar'
            bar(x,y)
        case 'scatter'
            scatter(x,y)
        case 'stairs'
            stairs(x,y,'LineWidth',2)
        otherwise
            plot(x,y,'LineWidth',2)
    end
    switch opt.scale
        case 'semilogy'
            semilogy(x,y);
    end
    ylabel(opt.ylab)
    title(obj.name)
    grid on
end

