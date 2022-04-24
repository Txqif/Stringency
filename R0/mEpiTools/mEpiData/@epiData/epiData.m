classdef epiData < handle
    %EPIDATA Store and manimulate epidemic data
    
    properties (SetAccess = private)
        I           % incidence data
        local
        imported
        C
    end
    
    properties
        start_date  % start date as datetime object = dates(1)
        population  % size of population
        name        % data name
    end
    

    methods
        function obj = epiData(varargin)
            %EPIDATA Construct an instance of this class
            if isempty(varargin)
                return
            end
            for n = 1:2:length(varargin)
                if isempty(varargin{n+1})
                    continue
                end
                switch lower(varargin{n})
                    case 'incid'
                        process_incid(obj, varargin{n+1});
                    case 'name'
                        obj.name = varargin{n+1};
                    case 'population'
                        obj.population = varargin{n+1};                        
                    case 'start_date'
                        obj.start_date = varargin{n+1};
                end
            end
        end
    end
    methods
        function set.name(obj,name)
            if isempty(name)
                obj.name = [];
                return
            end
            if ~isstring(name) && ~ischar(name)
                error('Excepted input to be char or string.')
            end
            obj.name = char(name);
        end
        function set.population(obj,population)
            if isempty(population)
                obj.population = [];
                return
            end
            validateattributes(population, {'numeric'},...
                {'integer','scalar','nonnegative'});
            obj.population = population;
        end
        function set.start_date(obj,start_date)
            if isempty(start_date)
                obj.start_date = [];
                return
            end
            if isdatetime(start_date)
                obj.start_date = start_date;
                return
            end
            if ~ischar(start_date) && ~isvector(start_date)
                error('Expected input to be char or vector.')
            end
            if isvector(start_date)
                validateattributes(start_date, {'numeric'},...
                    {'integer','vector','nonnegative','numel',3});
                if start_date(2) > 12
                    error('Invalid month number %d > 12.',start_date(2))
                end
                if start_date(3) > 31
                    error('Invalid day number %d > 31.',start_date(3))
                end
            end
            obj.start_date = datetime(start_date);
        end
    end

    methods
        function out = get.C(obj)
            if isempty(obj.I)
                out = [];
                return
            end
            out = cumsum(obj.I);
        end

    end
    methods
        process_incid(obj,incid)
        plot(obj,varargin)
        xyplot(obj,varargin)
    end
end

