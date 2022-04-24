% estimate_R is MATLAB translation of parts of the R package 'EpiEstim'
% ver 2.2-3
% https://cran.r-project.org/web/packages/EpiEstim/index.html

% In the translation, the original structure of the functions was preserved
% as far as possible, so that the EpiEstim reference manual can be used.
% (A.Cori et al., Package EpiEstim,
% https://cran.r-project.org/web/packages/EpiEstim/EpiEstim.pdf)

% Three methods are currently supported: 'parametric_si',
% 'non-parametric_s' and 'uncertain_s'.

% funMeFirst.m  set paths
% runCountry    run estimation for selected country and plot results.
% runEU         scan EU countries and write R, IR and AR to EU_DDMMYYYY.csv file.
% runWorld.m    scan complete data set stored in the 'data' folder

% The class 'estimate_R' has the following  properties extract from input
% incidence
%       obj.local 
%       obj.imported
%       obj.I (= res.local  + res.imported)
%       obj.start_date  (datetime object)
%       obj.name
%       obj.population
% If the input data field is messing then it is internaly set to [].

% Data for various countris can be obtained by running the function
% importDataWM.m. This functionwill read data from the <worldometers.info> 
% website and store them to folder 'data'.

% Function importData(country,start_date) colect data for specified country
% and store them into 'epiData' object, which can be use as input to
% estimate_R.
%
% Example: 
%   slo = importData('Slovenia',[]);
%   res = estimate_R(slo,___)
%
%   slo = importData('Slovenia',[2020,6,1]);
%   res = estimate_R(slo,___)

% NOTE 1: Double-quoted strings in R must be changed to a MATLAB column. For
% example: "parametric_si" should be used as "parammetric_si.

% NOTE2: Some new options have been added to the chart function 
% (for details see @Review_R / plot.m)

% NOTE3: If populatin is provided then also incidence rate (IR) and attack rate 
% are calcuulated. IR can be plot with command plot(__,'what','IR').

% NOTE4: Incidence rate (obj.IR) and attack rate (obj.AR) are calculated 
% if user provide population. IR can then be add to the plot with plot 
% with plot(__,'what',['IR',...],...)

% DISCLAIMER:  Software and data is for education and not for medical or 
% commercial use. They are provided as-is, and any express or implied
% warranties, including but not limited to implied warranties of %
% merchantability and fitness for a particular purpose, are disclaimed. 
% Use it at your own discretion.


% 31/07/2020 MB
