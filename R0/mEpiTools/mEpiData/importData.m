function obj = importData(name,start_date)
%IMPORTDATA Incidence data for given country
%   Detailed explanation goes here
    if nargin < 2
        start_date = [];
    end
    
    % country data
    data = findCountry(name);
    if isempty(data)
        error('No data for %s',name);
    end
    
    % get data for country
    sfunc = sprintf('getIncid%s',data.func_name);
    fh = str2func(sfunc);
    [incid,~] = fh();
    
    % left trim data
    if ~isempty(start_date)
        incid = trimData(incid,datetime(start_date));
    end
    
    % save data to object
    obj = epiData('incid',incid.I,'start_date',incid.start_date);
    obj.name = data.name;
    obj.population = data.population;
end

