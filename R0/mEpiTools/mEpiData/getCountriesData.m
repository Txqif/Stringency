function country = getCountriesData()
%GETCOUNTRIESDATA Total population in 2019 as reported by the World Bank
% https://data.worldbank.org/indicator/SP.POP.TOTL
% return structure with the fields 'name','code','population'
country.func_name = [...
"Afghanistan"
"Angola"
"Albania"
"Andorra"
""
"United_Arab_Emirates"
"Argentina"
"Armenia"
""
"Antigua_and_Barbuda"
"Australia"
"Austria"
"Azerbaijan"
""
"Belgium"
"Benin"
"Burkina_Faso"
"Bangladesh"
"Bulgaria"
"Bahrain"
"Bahamas"
"Bosnia_and_Herzegovina"
"Belarus"
"Belize"
"Bermuda"
"Bolivia"
"Brazil"
"Barbados"
"Brunei_Darussalam"
"Bhutan"
""
"Central_African_Republic"
"Canada"
""
"Switzerland"
""
"Chile"
"China"
""
"Cameroon"
"Congo"
""
"Colombia"
""
"Cabo_Verde"
"Costa_Rica"
""
"Cuba"
""
"Cayman_Islands"
"Cyprus"
"Czech_republic"
"Germany"
"Djibouti"
"Dominica"
"Denmark"
"Dominican_Republic"
"Algeria"
""
""
""
""
""
"Ecuador"
"Egypt"
""
"Eritrea"
"Spain"
"Estonia"
"Ethiopia"
""
""
"Finland"
"Fiji"
"France"
"Faeroe_Islands"
""
"Gabon"
"UK"
"Georgia"
"Ghana"
"Gibraltar"
""
"Gambia"
"Guinea"
"Equatorial_Guinea"
"Greece"
"Grenada"
"Greenland"
"Guatemala"
""
"Guyana"
""
""
"Honduras"
""
"Croatia"
"Haiti"
"Hungary"
""
""
""
""
"Indonesia"
""
"Isle_of_Man"
"India"
""
"Ireland"
"Iran"
"Iraq"
"Iceland"
"Israel"
"Italy"
"Jamaica"
"Jordan"
"Japan"
"Kazakhstan"
"Kenya"
"Kyrgyzstan"
"Cambodia"
""
""
"South_Korea"
"Kuwait"
""
"Laos"
"Lebanon"
"Liberia"
"Libya"
"Saint_Lucia"
""
""
""
"Liechtenstein"
"Sri_Lanka"
""
""
""
""
"Lithuania"
"Luxembourg"
"Latvia"
""
""
"Morocco"
"Monaco"
"Moldova"
"Madagascar"
"Maldives"
""
"Mexico"
""
""
"Macedonia"
""
"Malta"
"Myanmar"
""
"Montenegro"
"Mongolia"
""
"Mozambique"
"Mauritania"
"Mauritius"
""
"Malaysia"
""
"Namibia"
"New_Caledonia"
"Niger"
"Nigeria"
"Nicaragua"
"Netherlands"
"Norway"
"Nepal"
""
"New_Zealand"
""
"Oman"
""
"Pakistan"
"Panama"
"Peru"
"Philippines"
""
"Papua_New_Guinea"
"Poland"
""
""
""
"Portugal"
"Paraguay"
""
""
""
"French_Polynesia"
"Qatar"
"Romania"
"Russia"
"Rwanda"
""
"Saudi_Arabia"
"Sudan"
"Senegal"
"Singapore"
""
""
"El_Salvador"
"San_Marino"
"Somalia"
"Serbia"
""
""
""
""
""
"Suriname"
"Slovakia"
"Slovenia"
"Sweden"
"Swaziland"
""
"Seychelles"
"Syria"
""
"Chad"
""
""
"Togo"
"Thailand"
""
""
""
"Timor_Leste"
""
""
""
""
"Trinidad_and_Tobago"
"Tunisia"
"Turkey"
""
"Tanzania"
"Uganda"
"Ukraine"
""
"Uruguay"
"US"
"Uzbekistan"
""
"Venezuela"
""
""
"Viet_nam"
""
"World"
""
""
""
"South_Africa"
"Zambia"
"Zimbabwe"
];
country.name = [...
"Afghanistan"
"Angola"
"Albania"
"Andorra"
"Arab World"
"United Arab Emirates"
"Argentina"
"Armenia"
"American Samoa"
"Antigua and Barbuda"
"Australia"
"Austria"
"Azerbaijan"
"Burundi"
"Belgium"
"Benin"
"Burkina Faso"
"Bangladesh"
"Bulgaria"
"Bahrain"
"Bahamas, The"
"Bosnia and Herzegovina"
"Belarus"
"Belize"
"Bermuda"
"Bolivia"
"Brazil"
"Barbados"
"Brunei Darussalam"
"Bhutan"
"Botswana"
"Central African Republic"
"Canada"
"Central Europe and the Baltics"
"Switzerland"
"Channel Islands"
"Chile"
"China"
"Cote d'Ivoire"
"Cameroon"
"Congo, Dem. Rep."
"Congo, Rep."
"Colombia"
"Comoros"
"Cabo Verde"
"Costa Rica"
"Caribbean small states"
"Cuba"
"Curacao"
"Cayman Islands"
"Cyprus"
"Czech Republic"
"Germany"
"Djibouti"
"Dominica"
"Denmark"
"Dominican Republic"
"Algeria"
"East Asia & Pacific (excluding high income)"
"Early-demographic dividend"
"East Asia & Pacific"
"Europe & Central Asia (excluding high income)"
"Europe & Central Asia"
"Ecuador"
"Egypt, Arab Rep."
"Euro area"
"Eritrea"
"Spain"
"Estonia"
"Ethiopia"
"European Union"
"Fragile and conflict affected situations"
"Finland"
"Fiji"
"France"
"Faroe Islands"
"Micronesia, Fed. Sts."
"Gabon"
"United Kingdom"
"Georgia"
"Ghana"
"Gibraltar"
"Guinea"
"Gambia, The"
"Guinea-Bissau"
"Equatorial Guinea"
"Greece"
"Grenada"
"Greenland"
"Guatemala"
"Guam"
"Guyana"
"High income"
"Hong Kong SAR, China"
"Honduras"
"Heavily indebted poor countries (HIPC)"
"Croatia"
"Haiti"
"Hungary"
"IBRD only"
"IDA & IBRD total"
"IDA total"
"IDA blend"
"Indonesia"
"IDA only"
"Isle of Man"
"India"
"Not classified"
"Ireland"
"Iran, Islamic Rep."
"Iraq"
"Iceland"
"Israel"
"Italy"
"Jamaica"
"Jordan"
"Japan"
"Kazakhstan"
"Kenya"
"Kyrgyz Republic"
"Cambodia"
"Kiribati"
"St. Kitts and Nevis"
"Korea, Rep."
"Kuwait"
"Latin America & Caribbean (excluding high income)"
"Lao PDR"
"Lebanon"
"Liberia"
"Libya"
"St. Lucia"
"Latin America & Caribbean"
"Least developed countries: UN classification"
"Low income"
"Liechtenstein"
"Sri Lanka"
"Lower middle income"
"Low & middle income"
"Lesotho"
"Late-demographic dividend"
"Lithuania"
"Luxembourg"
"Latvia"
"Macao SAR, China"
"St. Martin (French part)"
"Morocco"
"Monaco"
"Moldova"
"Madagascar"
"Maldives"
"Middle East & North Africa"
"Mexico"
"Marshall Islands"
"Middle income"
"North Macedonia"
"Mali"
"Malta"
"Myanmar"
"Middle East & North Africa (excluding high income)"
"Montenegro"
"Mongolia"
"Northern Mariana Islands"
"Mozambique"
"Mauritania"
"Mauritius"
"Malawi"
"Malaysia"
"North America"
"Namibia"
"New Caledonia"
"Niger"
"Nigeria"
"Nicaragua"
"Netherlands"
"Norway"
"Nepal"
"Nauru"
"New Zealand"
"OECD members"
"Oman"
"Other small states"
"Pakistan"
"Panama"
"Peru"
"Philippines"
"Palau"
"Papua New Guinea"
"Poland"
"Pre-demographic dividend"
"Puerto Rico"
"Korea, Dem. People痴 Rep."
"Portugal"
"Paraguay"
"West Bank and Gaza"
"Pacific island small states"
"Post-demographic dividend"
"French Polynesia"
"Qatar"
"Romania"
"Russian Federation"
"Rwanda"
"South Asia"
"Saudi Arabia"
"Sudan"
"Senegal"
"Singapore"
"Solomon Islands"
"Sierra Leone"
"El Salvador"
"San Marino"
"Somalia"
"Serbia"
"Sub-Saharan Africa (excluding high income)"
"South Sudan"
"Sub-Saharan Africa"
"Small states"
"Sao Tome and Principe"
"Suriname"
"Slovak Republic"
"Slovenia"
"Sweden"
"Eswatini"
"Sint Maarten (Dutch part)"
"Seychelles"
"Syrian Arab Republic"
"Turks and Caicos Islands"
"Chad"
"East Asia & Pacific (IDA & IBRD countries)"
"Europe & Central Asia (IDA & IBRD countries)"
"Togo"
"Thailand"
"Tajikistan"
"Turkmenistan"
"Latin America & the Caribbean (IDA & IBRD countries)"
"Timor-Leste"
"Middle East & North Africa (IDA & IBRD countries)"
"Tonga"
"South Asia (IDA & IBRD)"
"Sub-Saharan Africa (IDA & IBRD countries)"
"Trinidad and Tobago"
"Tunisia"
"Turkey"
"Tuvalu"
"Tanzania"
"Uganda"
"Ukraine"
"Upper middle income"
"Uruguay"
"United States"
"Uzbekistan"
"St. Vincent and the Grenadines"
"Venezuela, RB"
"British Virgin Islands"
"Virgin Islands (U.S.)"
"Vietnam"
"Vanuatu"
"World"
"Samoa"
"Kosovo"
"Yemen, Rep."
"South Africa"
"Zambia"
"Zimbabwe"
];
country.code = [...
"AFG" % Afghanistan
"AGO" % Angola
"ALB" % Albania
"AND" % Andorra
"ARB" % Arab World
"ARE" % United Arab Emirates
"ARG" % Argentina
"ARM" % Armenia
"ASM" % American Samoa
"ATG" % Antigua and Barbuda
"AUS" % Australia
"AUT" % Austria
"AZE" % Azerbaijan
"BDI" % Burundi
"BEL" % Belgium
"BEN" % Benin
"BFA" % Burkina Faso
"BGD" % Bangladesh
"BGR" % Bulgaria
"BHR" % Bahrain
"BHS" % Bahamas, The
"BIH" % Bosnia and Herzegovina
"BLR" % Belarus
"BLZ" % Belize
"BMU" % Bermuda
"BOL" % Bolivia
"BRA" % Brazil
"BRB" % Barbados
"BRN" % Brunei Darussalam
"BTN" % Bhutan
"BWA" % Botswana
"CAF" % Central African Republic
"CAN" % Canada
"CEB" % Central Europe and the Baltics
"CHE" % Switzerland
"CHI" % Channel Islands
"CHL" % Chile
"CHN" % China
"CIV" % Cote d'Ivoire
"CMR" % Cameroon
"COD" % Congo, Dem. Rep.
"COG" % Congo, Rep.
"COL" % Colombia
"COM" % Comoros
"CPV" % Cabo Verde
"CRI" % Costa Rica
"CSS" % Caribbean small states
"CUB" % Cuba
"CUW" % Curacao
"CYM" % Cayman Islands
"CYP" % Cyprus
"CZE" % Czech Republic
"DEU" % Germany
"DJI" % Djibouti
"DMA" % Dominica
"DNK" % Denmark
"DOM" % Dominican Republic
"DZA" % Algeria
"EAP" % East Asia & Pacific (excluding high income)
"EAR" % Early-demographic dividend
"EAS" % East Asia & Pacific
"ECA" % Europe & Central Asia (excluding high income)
"ECS" % Europe & Central Asia
"ECU" % Ecuador
"EGY" % Egypt, Arab Rep.
"EMU" % Euro area
"ERI" % Eritrea
"ESP" % Spain
"EST" % Estonia
"ETH" % Ethiopia
"EUU" % European Union
"FCS" % Fragile and conflict affected situations
"FIN" % Finland
"FJI" % Fiji
"FRA" % France
"FRO" % Faroe Islands
"FSM" % Micronesia, Fed. Sts.
"GAB" % Gabon
"GBR" % United Kingdom
"GEO" % Georgia
"GHA" % Ghana
"GIB" % Gibraltar
"GIN" % Guinea
"GMB" % Gambia, The
"GNB" % Guinea-Bissau
"GNQ" % Equatorial Guinea
"GRC" % Greece
"GRD" % Grenada
"GRL" % Greenland
"GTM" % Guatemala
"GUM" % Guam
"GUY" % Guyana
"HIC" % High income
"HKG" % Hong Kong SAR, China
"HND" % Honduras
"HPC" % Heavily indebted poor countries (HIPC)
"HRV" % Croatia
"HTI" % Haiti
"HUN" % Hungary
"IBD" % IBRD only
"IBT" % IDA & IBRD total
"IDA" % IDA total
"IDB" % IDA blend
"IDN" % Indonesia
"IDX" % IDA only
"IMN" % Isle of Man
"IND" % India
"INX" % Not classified
"IRL" % Ireland
"IRN" % Iran, Islamic Rep.
"IRQ" % Iraq
"ISL" % Iceland
"ISR" % Israel
"ITA" % Italy
"JAM" % Jamaica
"JOR" % Jordan
"JPN" % Japan
"KAZ" % Kazakhstan
"KEN" % Kenya
"KGZ" % Kyrgyz Republic
"KHM" % Cambodia
"KIR" % Kiribati
"KNA" % St. Kitts and Nevis
"KOR" % Korea, Rep.
"KWT" % Kuwait
"LAC" % Latin America & Caribbean (excluding high income)
"LAO" % Lao PDR
"LBN" % Lebanon
"LBR" % Liberia
"LBY" % Libya
"LCA" % St. Lucia
"LCN" % Latin America & Caribbean
"LDC" % Least developed countries: UN classification
"LIC" % Low income
"LIE" % Liechtenstein
"LKA" % Sri Lanka
"LMC" % Lower middle income
"LMY" % Low & middle income
"LSO" % Lesotho
"LTE" % Late-demographic dividend
"LTU" % Lithuania
"LUX" % Luxembourg
"LVA" % Latvia
"MAC" % Macao SAR, China
"MAF" % St. Martin (French part)
"MAR" % Morocco
"MCO" % Monaco
"MDA" % Moldova
"MDG" % Madagascar
"MDV" % Maldives
"MEA" % Middle East & North Africa
"MEX" % Mexico
"MHL" % Marshall Islands
"MIC" % Middle income
"MKD" % North Macedonia
"MLI" % Mali
"MLT" % Malta
"MMR" % Myanmar
"MNA" % Middle East & North Africa (excluding high income)
"MNE" % Montenegro
"MNG" % Mongolia
"MNP" % Northern Mariana Islands
"MOZ" % Mozambique
"MRT" % Mauritania
"MUS" % Mauritius
"MWI" % Malawi
"MYS" % Malaysia
"NAC" % North America
"NAM" % Namibia
"NCL" % New Caledonia
"NER" % Niger
"NGA" % Nigeria
"NIC" % Nicaragua
"NLD" % Netherlands
"NOR" % Norway
"NPL" % Nepal
"NRU" % Nauru
"NZL" % New Zealand
"OED" % OECD members
"OMN" % Oman
"OSS" % Other small states
"PAK" % Pakistan
"PAN" % Panama
"PER" % Peru
"PHL" % Philippines
"PLW" % Palau
"PNG" % Papua New Guinea
"POL" % Poland
"PRE" % Pre-demographic dividend
"PRI" % Puerto Rico
"PRK" % Korea, Dem. People痴 Rep.
"PRT" % Portugal
"PRY" % Paraguay
"PSE" % West Bank and Gaza
"PSS" % Pacific island small states
"PST" % Post-demographic dividend
"PYF" % French Polynesia
"QAT" % Qatar
"ROU" % Romania
"RUS" % Russian Federation
"RWA" % Rwanda
"SAS" % South Asia
"SAU" % Saudi Arabia
"SDN" % Sudan
"SEN" % Senegal
"SGP" % Singapore
"SLB" % Solomon Islands
"SLE" % Sierra Leone
"SLV" % El Salvador
"SMR" % San Marino
"SOM" % Somalia
"SRB" % Serbia
"SSA" % Sub-Saharan Africa (excluding high income)
"SSD" % South Sudan
"SSF" % Sub-Saharan Africa
"SST" % Small states
"STP" % Sao Tome and Principe
"SUR" % Suriname
"SVK" % Slovak Republic
"SVN" % Slovenia
"SWE" % Sweden
"SWZ" % Eswatini
"SXM" % Sint Maarten (Dutch part)
"SYC" % Seychelles
"SYR" % Syrian Arab Republic
"TCA" % Turks and Caicos Islands
"TCD" % Chad
"TEA" % East Asia & Pacific (IDA & IBRD countries)
"TEC" % Europe & Central Asia (IDA & IBRD countries)
"TGO" % Togo
"THA" % Thailand
"TJK" % Tajikistan
"TKM" % Turkmenistan
"TLA" % Latin America & the Caribbean (IDA & IBRD countries)
"TLS" % Timor-Leste
"TMN" % Middle East & North Africa (IDA & IBRD countries)
"TON" % Tonga
"TSA" % South Asia (IDA & IBRD)
"TSS" % Sub-Saharan Africa (IDA & IBRD countries)
"TTO" % Trinidad and Tobago
"TUN" % Tunisia
"TUR" % Turkey
"TUV" % Tuvalu
"TZA" % Tanzania
"UGA" % Uganda
"UKR" % Ukraine
"UMC" % Upper middle income
"URY" % Uruguay
"USA" % United States
"UZB" % Uzbekistan
"VCT" % St. Vincent and the Grenadines
"VEN" % Venezuela, RB
"VGB" % British Virgin Islands
"VIR" % Virgin Islands (U.S.)
"VNM" % Vietnam
"VUT" % Vanuatu
"WLD" % World
"WSM" % Samoa
"XKX" % Kosovo
"YEM" % Yemen, Rep.
"ZAF" % South Africa
"ZMB" % Zambia
"ZWE" % Zimbabwe
];
country.population = [...
38041754 % Afghanistan
31825295 % Angola
2854191 % Albania
77142 % Andorra
427870270 % Arab World
9770529 % United Arab Emirates
44938712 % Argentina
2957731 % Armenia
55312 % American Samoa
97118 % Antigua and Barbuda
25364307 % Australia
8877067 % Austria
10023318 % Azerbaijan
11530580 % Burundi
11484055 % Belgium
11801151 % Benin
20321378 % Burkina Faso
163046161 % Bangladesh
6975761 % Bulgaria
1641172 % Bahrain
389482 % Bahamas, The
3301000 % Bosnia and Herzegovina
9466856 % Belarus
390353 % Belize
63918 % Bermuda
11513100 % Bolivia
211049527 % Brazil
287025 % Barbados
433285 % Brunei Darussalam
763092 % Bhutan
2303697 % Botswana
4745185 % Central African Republic
37589262 % Canada
102378579 % Central Europe and the Baltics
8574832 % Switzerland
172259 % Channel Islands
18952038 % Chile
1397715000 % China
25716544 % Cote d'Ivoire
25876380 % Cameroon
86790567 % Congo, Dem. Rep.
5380508 % Congo, Rep.
50339443 % Colombia
850886 % Comoros
549935 % Cabo Verde
5047561 % Costa Rica
7401381 % Caribbean small states
11333483 % Cuba
157538 % Curacao
64948 % Cayman Islands
1198575 % Cyprus
10669709 % Czech Republic
83132799 % Germany
973560 % Djibouti
71808 % Dominica
5818553 % Denmark
10738958 % Dominican Republic
43053054 % Algeria
2093675040 % East Asia & Pacific (excluding high income)
3290290622 % Early-demographic dividend
2340628292 % East Asia & Pacific
399404587 % Europe & Central Asia (excluding high income)
921140092 % Europe & Central Asia
17373662 % Ecuador
100388073 % Egypt, Arab Rep.
342597698 % Euro area
NaN % Eritrea
47076781 % Spain
1326590 % Estonia
112078730 % Ethiopia
447512041 % European Union
760603096 % Fragile and conflict affected situations
5520314 % Finland
889953 % Fiji
67059887 % France
48678 % Faroe Islands
113815 % Micronesia, Fed. Sts.
2172579 % Gabon
66834405 % United Kingdom
3720382 % Georgia
30417856 % Ghana
33701 % Gibraltar
12771246 % Guinea
2347706 % Gambia, The
1920922 % Guinea-Bissau
1355986 % Equatorial Guinea
10716322 % Greece
112003 % Grenada
56225 % Greenland
16604026 % Guatemala
167294 % Guam
782766 % Guyana
1235852827 % High income
7507400 % Hong Kong SAR, China
9746117 % Honduras
801708035 % Heavily indebted poor countries (HIPC)
4067500 % Croatia
11263077 % Haiti
9769949 % Hungary
4816235951 % IBRD only
6486934851 % IDA & IBRD total
1670698900 % IDA total
561572202 % IDA blend
270625568 % Indonesia
1109126698 % IDA only
84584 % Isle of Man
1366417754 % India
NaN % Not classified
4941444 % Ireland
82913906 % Iran, Islamic Rep.
39309783 % Iraq
361313 % Iceland
9053300 % Israel
60297396 % Italy
2948279 % Jamaica
10101694 % Jordan
126264931 % Japan
18513930 % Kazakhstan
52573973 % Kenya
6456900 % Kyrgyz Republic
16486542 % Cambodia
117606 % Kiribati
52823 % St. Kitts and Nevis
51709098 % Korea, Rep.
4207083 % Kuwait
613773128 % Latin America & Caribbean (excluding high income)
7169455 % Lao PDR
6855713 % Lebanon
4937374 % Liberia
6777452 % Libya
182790 % St. Lucia
646430841 % Latin America & Caribbean
1033388876 % Least developed countries: UN classification
668454965 % Low income
38019 % Liechtenstein
21803000 % Sri Lanka
2913363391 % Lower middle income
6437681145 % Low & middle income
2125268 % Lesotho
2298470832 % Late-demographic dividend
2786844 % Lithuania
619896 % Luxembourg
1912789 % Latvia
640445 % Macao SAR, China
38002 % St. Martin (French part)
36471769 % Morocco
38964 % Monaco
2657637 % Moldova
26969307 % Madagascar
530953 % Maldives
456707404 % Middle East & North Africa
127575529 % Mexico
58791 % Marshall Islands
5769226180 % Middle income
2083459 % North Macedonia
19658031 % Mali
502653 % Malta
54045420 % Myanmar
389457086 % Middle East & North Africa (excluding high income)
622137 % Montenegro
3225167 % Mongolia
57216 % Northern Mariana Islands
30366036 % Mozambique
4525696 % Mauritania
1265711 % Mauritius
18628747 % Malawi
31949777 % Malaysia
365892703 % North America
2494530 % Namibia
287800 % New Caledonia
23310715 % Niger
200963599 % Nigeria
6545502 % Nicaragua
17332850 % Netherlands
5347896 % Norway
28608710 % Nepal
12581 % Nauru
4917000 % New Zealand
1359963500 % OECD members
4974986 % Oman
31360407 % Other small states
216565318 % Pakistan
4246439 % Panama
32510453 % Peru
108116615 % Philippines
18008 % Palau
8776109 % Papua New Guinea
37970874 % Poland
944902749 % Pre-demographic dividend
3193694 % Puerto Rico
25666161 % Korea, Dem. People痴 Rep.
10269417 % Portugal
7044636 % Paraguay
4685306 % West Bank and Gaza
2493696 % Pacific island small states
1112914457 % Post-demographic dividend
279287 % French Polynesia
2832067 % Qatar
19356544 % Romania
144373535 % Russian Federation
12626950 % Rwanda
1835776742 % South Asia
34268528 % Saudi Arabia
42813238 % Sudan
16296364 % Senegal
5703569 % Singapore
669823 % Solomon Islands
7813215 % Sierra Leone
6453553 % El Salvador
33860 % San Marino
15442905 % Somalia
6944975 % Serbia
1105594562 % Sub-Saharan Africa (excluding high income)
11062113 % South Sudan
1106957898 % Sub-Saharan Africa
41255484 % Small states
215056 % Sao Tome and Principe
581372 % Suriname
5454073 % Slovak Republic
2087946 % Slovenia
10285453 % Sweden
1148130 % Eswatini
40733 % Sint Maarten (Dutch part)
97625 % Seychelles
17070135 % Syrian Arab Republic
38191 % Turks and Caicos Islands
15946876 % Chad
2067984156 % East Asia & Pacific (IDA & IBRD countries)
460799505 % Europe & Central Asia (IDA & IBRD countries)
8082366 % Togo
69625582 % Thailand
9321018 % Tajikistan
5942089 % Turkmenistan
630644770 % Latin America & the Caribbean (IDA & IBRD countries)
1293119 % Timor-Leste
384771780 % Middle East & North Africa (IDA & IBRD countries)
104494 % Tonga
1835776742 % South Asia (IDA & IBRD)
1106957898 % Sub-Saharan Africa (IDA & IBRD countries)
1394973 % Trinidad and Tobago
11694719 % Tunisia
83429615 % Turkey
11646 % Tuvalu
58005463 % Tanzania
44269594 % Uganda
44385155 % Ukraine
2855862789 % Upper middle income
3461734 % Uruguay
328239523 % United States
33580650 % Uzbekistan
110589 % St. Vincent and the Grenadines
28515829 % Venezuela, RB
30030 % British Virgin Islands
106631 % Virgin Islands (U.S.)
96462106 % Vietnam
299882 % Vanuatu
7673533972 % World
197097 % Samoa
1794248 % Kosovo
29161922 % Yemen, Rep.
58558270 % South Africa
17861030 % Zambia
14645468 % Zimbabwe
];
end
