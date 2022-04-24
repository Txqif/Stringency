% Parameters of the model for phase 1 (no ops pulih phase) and 
% phase 2 (OPS PULIH phase) are saved in the variables
%'est_parameters1' and 'est_parameters2', respectively. 
%The simulation results of active cases, deaths and recovered cases for lockdown 
%percentages of 90%, 50%, 0% and 79.63% are saved in the first three, 
%second three, third three and last three rows of the variable y.

%Brunei Strigency at this duration is 79.63%
%household used(lambda) will be 5
clc
clear 
close all
warning off
%estimation data setup
Brunei_population= 440333;
data = get_data('Brunei2.csv', Brunei_population);

D_measured = data.OutputData(:,1)';  %Detected (active cases) in column 1
E_measured = data.OutputData(:,2)';  %Excinct (Deaths) in column 2
Rd_measured = data.OutputData(:,3)'; %Recovered in column 3


Time=zeros(3,500);
x=zeros(3,500);
y=zeros(3,500);
% ----------------Start of the epidemic (NO OPS PULIH)----------------------
% Initial conditions
U0 = 65/Brunei_population;
D0 = D_measured(1);
E0 = E_measured(1);
Ru0 = 0;
Rd0 = Rd_measured(1);
S0 = 1 - U0 -D0 - E0 - Ru0 - Rd0;

initial_conditions = [S0 U0 D0 E0 Ru0 Rd0]';
estimate_undetected = 0; % do not estimate the initial condition
start_day = 1; %01/03/2020
end_day = 48;
after_opspulih_day = 48;
update_days = [1];
identification_windows = [47];
%% 
%parameter no1(higher the value the higher the curve
%no 2(higher the value the lower the curve) for stringency curve
%parameter no 3 and 4 for 1st day to lockdown curve
%parameter no5 for starting curve lockdown
params = [0.08448;0.013;0.0129;0.0001;0.00641]; %parameters for free phase

estimate_params = 0*[1 1 1 1 1];%parameters are not updated in this free phase of 23 days 
weights = [10000 1000 1000];
[Time1, x1, y1, est_parameters1] = simulate_suder_forBrunei(initial_conditions, estimate_undetected, start_day, end_day, update_days, identification_windows, params, estimate_params, weights, data);

% ---------------------------First Lockdown--------------------------------
% Parameters of free parts are same with the latest parameters before lockdown.  
% Parameters of lockdown parts are estimated only once at the beginning.
% 4 Different lockdown percentages in L_set are tested
L_set=[0.9 0.5 0 0.7963]; % Different lockdown percentages
for i=1:4
lockdown_length =46; 
initial_conditions = x1(:,end);
start_day = 48;
end_day = start_day + lockdown_length + after_opspulih_day; 
L = L_set(i); %lockdown percentage
lambda = 5; %household size
update_days = [48];
identification_windows = [50];
%%
params=[0.45;0.33;0.03;0.066;0.0009;1;0.089;0.0047;0.8;0.012;8];
estimate_params = 0*[0 0 0 0 0 1 1 1 1 1 1]; %parameters are not updated.
weights = [1000 500 100];
[Time2, x2, y2, est_parameters2] = simulate_lockdown(initial_conditions, start_day, end_day, L, lambda, update_days, identification_windows, params, estimate_params, weights, Brunei_population, data);

s_t(i)=size([Time1 Time2],2);
Time(i,1:s_t(i)) = [Time1 Time2];
y((3*i-2:3*i),1:s_t(i)) = [y1 y2];
x((6*i-5:6*i),1:s_t(i)) = [x1 get_suder(x2)];

end


%--------------------------------plotting----------------------------------
%The results are converted from the fraction of the population to the 
%percentage of the population.
color_set=[0.07,0.62,1.00;1.00,0.00,1.00;1.00,0.00,0.00;0,0,1]; % Different color(RBG value)

%Detected
figure;
hold on; grid on;
xlim([0 125])
ylim([0 0.15])
start_day = 1;

%shadows for free and lockdown phase
shadow1 = patch([0,0,48,48],[0, 0.3,0.3,0],[0.1 0.1 0.07]);
set(shadow1,'EdgeColor',[.8 .8 .8],'EdgeAlpha',0.5,'FaceAlpha',0.1)
shadow2 = patch([48,48,94,94],[0, 0.5,0.5,0],[0 1 0]);
set(shadow2,'EdgeColor',[.8 .8 .8],'EdgeAlpha',0.5,'FaceAlpha',0.2)
shadow3 = patch([94,94,142,142],[0, 0.3,0.3,0],[0.1 0.1 0.07]);
set(shadow3,'EdgeColor',[.8 .8 .8],'EdgeAlpha',0.5,'FaceAlpha',0.1)

%Official data and model
%Convert from fraction to percentage
plot(start_day:end_day, 100*D_measured(start_day:end_day), '--b'); 
for i=1:4
plot(Time(i,1:s_t(i)), 100*y(3*i-2,1:s_t(i)),'color',color_set(i,:) ) %plot with different color
end

xlabel('Time (days)')
ylabel('Cases (percentage of the Brunei population)')
title('Predicted OPS PULIH active cases: different lockdown percentages')

%construct legend in appropriate order
allChildren = get(gca, 'Children'); 
legend(allChildren([6 7 5 1 4 3 2]),{'NO OPS-PULIH Phase','OPS-PULIH Phase','Confirmed Data','79.63%','90%','50%','0%'},'NumColumns',2)
legend('Location','northeast')

%text arrows
ta = annotation('textarrow', [0.49 0.43], [0.170 0.170]);
ta.String = ['\it\bf04/10/2021',char(10),'(day 48) '];              
ta.Color = [0.00 0.00 0.70];     

tb = annotation('textarrow', [0.77 0.718], [0.40 0.40]);
tb.String = ['\it\bf18/11/2021',char(10),'(day 94) '];              
tb.Color = [0.00 0.00 0.70]; 

set(gca,'layer','top','gridlinestyle','-')

%Death
figure;
hold on; grid on;
xlim([0 130])
ylim([0 0.06])

%shadows for free and lockdown phase
shadow1 = patch([0,0,48,48],[0, 0.3,0.3,0],[0.1 0.1 0.07]);
set(shadow1,'EdgeColor',[.8 .8 .8],'EdgeAlpha',0.5,'FaceAlpha',0.1)
shadow2 = patch([48,48,94,94],[0, 0.5,0.5,0],[0 1 0]);
set(shadow2,'EdgeColor',[.8 .8 .8],'EdgeAlpha',0.5,'FaceAlpha',0.2)
shadow3 = patch([94,94,142,142],[0, 0.3,0.3,0],[0.1 0.1 0.07]);
set(shadow3,'EdgeColor',[.8 .8 .8],'EdgeAlpha',0.5,'FaceAlpha',0.1)


%Convert from fraction to percentage
plotting = plot(start_day:end_day, 100*E_measured(start_day:end_day), '--b'); 
for i=1:4
plot(Time(i,1:s_t(i)), 100*y(3*i-1,1:s_t(i)),'color',color_set(i,:) ) %plot with different color
end

xlabel('Time (days)')
ylabel('Cases (percentage of the population)')
title('Predicted deaths: different lockdown percentages')

%construct legend in appropriate order
allChildren = get(gca, 'Children'); 
legend(allChildren([6 7 5 1 4 3 2]),{'NO OPS-PULIH Phase','OPS-PULIH Phase','Confirmed Data','79.63%','90%','50%','0%'},'NumColumns',2)
legend('Location','northeast')

%text arrows
ta = annotation('textarrow', [0.470 0.415], [0.170 0.170]);
ta.String = ['\it\bf4/10/2021',char(10),'(day 48) '];              
ta.Color = [0.00 0.00 0.70];     

tb = annotation('textarrow', [0.75 0.69], [0.40 0.40]);
tb.String = ['\it\bf18/11/2021',char(10),'(day 94) '];              
tb.Color = [0.00 0.00 0.70]; 

set(gca,'layer','top','gridlinestyle','-')