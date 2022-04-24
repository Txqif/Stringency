% This is a script for automated data transfer on the total number of
% COVID-19 cases for each country from the <worldometers.info> website.
% Function file getIncidXXXXX.m, which contains daily new cases, is 
% generated for each country XXXX. The function is stored into the 'data' 
% folder.

% 15/07/2020  MB Created

% which countries?
name = getCountryNames();

% set target folder
oldFolder = cd('data');
pwd
path = pwd;

% loop over countries
nn = 0;
ffname = {};
for n = 1:length(name)
    
    % check country name
    nname = name{n};
    if strcmp("",nname)
        continue
    end
    
    % get data
    try
        [C,T] = getData(nname);
        I = size(C,1);
        I(1) = C(1);
        for i = 2:length(C)
            I(i) = C(i) - C(i-1);            
            if I(i) < 0
                I(i) = 0;
            end
        end
    catch
        disp(nname)
        continue
    end
    
    % check data
    if isempty(C)
        disp(nname)
        continue
    end
    
    % setup file name
    nname = strrep(nname,'/','_');
    nname = strrep(nname,' ','_');
    nname = strrep(nname,'-','_');
    nname = strrep(nname,'''','_');
    nname = strrep(nname,'(','_');
    nname = strrep(nname,')','_');
    fname = sprintf('getIncid%s.m',nname);
    
    % open new file
    fid = fopen(fullfile(path,fname),'w');
    if fid < 0
        fprintf('***Fail to open %s\n',fname);
        continue
    end
    
    fprintf('%d/%d country %s ...\n',length(name),n,nname);
    
    % trim front
    n0 = 0;
    for n = 1:length(I)
        if ~isnan(I(n)) && I(n) ~= 0
            T = T + n - 1;
            n0 = n;
            break
        end
    end
   if n0 == 0       
        fprintf('Invalid data.\n')
        return
   end
   if n0 > 1
       I = I(n0:end);
   end
    
    % generate function that contains data
    fprintf(fid,'function [incid,country] = getIncid%s()\n',nname);
    fprintf(fid,'%%GETINCID%s Coronavirus data for %s\n',upper(nname),nname);
    fprintf(fid,'%%  as reported by worldometers.info\n');
    fprintf(fid,'%%     https://www.worldometers.info/coronavirus/\n');
    fprintf(fid,'country = ''%s'';\n',strrep(nname,'_',' '));
    fprintf(fid,'incid.I = [...\n');
    for m = 1:length(I)
%         if T + m - 1 < T0
%             continue
%         end
        fprintf(fid,'%d %% %s\n',I(m),datestr(T + m - 1,'dd/mm/yyyy'));
    end
    fprintf(fid,'%%<-------------- add new data here\n');
    fprintf(fid,']'';\n');
    % start date
%     dates = datenum(datestr(T)):datenum(datestr(T))+length(I)-1;
%     dates = datetime(datestr(dates));
   % fprintf(fid,'incid.dates = datetime(datenum(datestr(T)):datenum(datestr(%s))+length(I)-1;\n',datestr(T));
    fprintf(fid,'incid.start_date = datetime(''%s'');\n',datestr(T));
    fprintf(fid,'end\n');
    
    % close file
    fclose(fid);
    
    % save name
    nn = nn + 1;
    ffname{nn} = nname;
end

% % save names
% fid = fopen(fullfile(path,'aaab.csv'),'w');
% if fid < 0
%     fprintf('***Fail to open %s\n',fname);
% else
%     fprintf(fid,'%s\n','name');
%     for m = 1:length(ffname)
%         fprintf(fid,'%s\n',ffname{m});
%     end
% end
% fclose(fid);

% return old folder
cd(oldFolder)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [C,T] = getData(country)
%Read covid-19 data from www.worldometers.info/coronavirus
%
% Input:
%   country -- country name
%
% Output:
%   C -- daily total cases
%   T -- start serial date

    if strcmpi(country,'world')
        url = 'https://www.worldometers.info/coronavirus/';
    else
        if ~contains(country,'/')
            url = 'https://www.worldometers.info/coronavirus/country/';
            url = strcat(url,lower(country));
        else
            url = 'https://www.worldometers.info/coronavirus/';
            url = strcat(url,lower(country));
        end
    end
    try
        html = webread(url);
    catch
        fprintf('No information for %s found.\n',country);
        C = [];
        T = [];
        return
    end
    pattern1 = 'Total Cases';% start of list
    pattern2 = 'responsive';     % end of list
    list = extractBetween(html, pattern1, pattern2);
    list1 = extractBetween(list{1}, 'categories: ', '}');
    list2 = extractBetween(list{1}, 'data: ', '}');
    C = str2num(cell2mat(list2));
    D = list1';
    D = extractBetween(D, '"', '"');
    T = datenum(strcat('2020.',strrep(D{1},' ','.')),'yyyy.mm.dd');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function names = getCountryNames()
names = [
    "World"
    "Afghanistan"
    "Albania"
    "Algeria"
    "Andorra"
    "Angola"
    "Antigua-and-Barbuda"
    "Argentina"
    "Aruba"
    "Armenia"
    "Australia"
    "Austria"
    "Azerbaijan"
    "Bahamas"
    "Bahrain"
    "Bangladesh"
    "Barbados"
    "Belarus"
    "Belgium"
    "Belize"
    "Benin"
    "Bermuda"
    "Bhutan"
    "Bolivia"
    "Bosnia-and-Herzegovina"
    "Brazil"
    "Brunei-Darussalam"
    "Bulgaria"
    "Burkina-Faso"
    "Cambodia"
    "Cameroon"
    "Canada"
    "Cabo-Verde"
    "Cayman-Islands"
    "Central-African-Republic"
    "Chad"
    "Chile"
    "China"
    "Colombia"
    "Congo"
    "Costa-Rica"
    "Croatia"
    "Cuba"
    "Cyprus"
    "Czech-republic"
    "Congo"
    "Denmark"
    "Djibouti"
    "Dominica"
    "Dominican-Republic"
    "Ecuador"
    "Egypt"
    "El-Salvador"
    "Equatorial-Guinea"
    "Eritrea"
    "Estonia"
    "Ethiopia"
    "Faeroe-Islands"
    "Fiji"
    "Finland"
    "France"
    "French-Polynesia"
    "Gabon"
    "Gambia"
    "Georgia"
    "Germany"
    "Ghana"
    "Gibraltar"
    "Greece"
    "Greenland"
    "Grenada"
    "Guatemala"
    "Guinea"
    "Guyana"
    "Haiti"
    "Honduras"
    "Hungary"
    "Iceland"
    "India"
    "Indonesia"
    "Iran"
    "Iraq"
    "Ireland"
    "Isle-of-Man"
    "Israel"
    "Italy"
    "Ivory-Coast"
    "Jamaica"
    "Japan"
    "Jordan"
    "Kazakhstan"
    "Kenya"
    "Kuwait"
    "Kyrgyzstan"
    "Laos"
    "Latvia"
    "Lebanon"
    "Liberia"
    "Libya"
    "Liechtenstein"
    "Lithuania"
    "Luxembourg"
    "Macedonia"
    "Madagascar"
    "Malaysia"
    "Maldives"
    "Malta"
    "Mauritania"
    "Mauritius"
    "Mexico"
    "Moldova"
    "Monaco"
    "Mongolia"
    "Montenegro"
    "Montserrat"
    "Morocco"
    "Mozambique"
    "Myanmar"
    "Namibia"
    "Nepal"
    "Netherlands"
    "New-Caledonia"
    "New-Zealand"
    "Nicaragua"
    "Niger"
    "Nigeria"
    "Norway"
    "Oman"
    "Pakistan"
    "State-of-Palestine"
    "Panama"
    "Papua-New-Guinea"
    "Paraguay"
    "Peru"
    "Philippines"
    "Poland"
    "Portugal"
    "Qatar"
    "Romania"
    "Russia"
    "Rwanda"
    "Saint-Lucia"
    "San-Marino"
    "Saudi-Arabia"
    "Senegal"
    "Serbia"
    "Seychelles"
    "Singapore"
    "Slovakia"
    "Slovenia"
    "Somalia"
    "South-Africa"
    "South-Korea"
    "Spain"
    "Sri-Lanka"
    "Sudan"
    "Suriname"
    "Swaziland"
    "Sweden"
    "Switzerland"
    "Syria"
    "Taiwan"
    "Tanzania"
    "Thailand"
    "Timor-Leste"
    "Togo"
    "Trinidad-and-Tobago"
    "Tunisia"
    "Turkey"
    "Uganda"
    "Ukraine"
    "United-Arab-Emirates"
    "UK"
    "US"
    "USA/Florida"
    "USA/Texas"
    "Uruguay"
    "Uzbekistan"
    "Holy-See"
    "Venezuela"
    "Viet-nam"
    "Zambia"
    "Zimbabwe"
    ];
end

