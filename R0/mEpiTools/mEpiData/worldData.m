% generate getCountriesData function
year = 2019;
fnam = 'getCountriesData.m';
fprintf('Generate function %s for year %d...\n',fnam,year);
T = readtable(sprintf('World_population_%d.xlsx',year),...
    'PreserveVariableNames',true);
nn = length(T{:,1});
fid = fopen(fnam,'w');
if fid < 0
    error('Fail to open file %s.',fnam)
end
fprintf(fid,'function country = %s()\n',fnam(1:end-2));
fprintf(fid,'%%GETCOUNTRIESDATA Total population in %d as reported by the World Bank\n',year);
fprintf(fid,'%% https://data.worldbank.org/indicator/SP.POP.TOTL\n');
fprintf(fid,'%% return structure with the fields ''name'',''code'',''population''\n');
fprintf(fid,'country.func_name = [...\n');
for n = 2:nn
    fprintf(fid,'"%s"\n',string(T{n,1}));
end
fprintf(fid,'];\n');
fprintf(fid,'country.name = [...\n');
for n = 2:nn
    fprintf(fid,'"%s"\n',string(T{n,2}));
end
fprintf(fid,'];\n');
fprintf(fid,'country.code = [...\n');
for n = 2:nn
    fprintf(fid,'"%s" %% %s\n',string(T{n,3}),string(T{n,2}));
end
fprintf(fid,'];\n');
fprintf(fid,'country.population = [...\n');
for n = 2:nn
    fprintf(fid,'%d %% %s\n',T{n,4},string(T{n,2}));
end
fprintf(fid,'];\n');
fprintf(fid,'end\n');
fclose(fid);
