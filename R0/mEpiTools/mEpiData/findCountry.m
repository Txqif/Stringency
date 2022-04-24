function data = findCountry(name)
%FINDCOUNTRY Find country in dataTab by name (or code)
    dataTab = getCountriesData();
    n = find(dataTab.func_name == name);
    if isempty(n)
        n = find(dataTab.name == name);
        if isempty(n)
            n = find(dataTab.code == name);
        end
    end
    if isempty(n)
        data = [];
    else
        data.func_name = dataTab.func_name(n);
        data.name = dataTab.name(n);
       % data.code = dataTab.code(n);
        data.population = dataTab.population(n);
    end
end

