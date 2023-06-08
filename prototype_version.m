clear all 
close all

%Load the data file and extract the data
load('/MATLAB Drive/Group1_measurments.mat');
lat=Position.latitude;
lon=Position.longitude;
positionDatetime=Position.Timestamp;


%Calculate the distance between each position of (lat,lon) using Harvesine
displacement = HaversineDistance(lat, lon);

for i = 2:length(displacement)
    distElapsed(i) = sum(displacement(1:i));
end


%Calculate the total distance travelled
total_distance = sum(displacement);


%Calculate the time duration using timeElapsed
timestamp = timeElapsed(positionDatetime);
maxtime = max(timestamp);
for ii=1:length(timestamp)-1
    timeduration(ii)=timestamp(ii+1)-timestamp(ii);
end

%Calculate the instant velocity at each time interval
velocity = displacement./timeduration';


% Set the assumed stride length in meters
stride_length = 0.8;
% Calculate the steps taken
steps_taken = round(total_distance / stride_length,0);


%Display Results:
disp('-------------------------------------------------------------')
disp('Welcome to fitness app')
disp(' ')
disp('-------------------------------------------------------------')
disp('Results from excersise:')
disp('-------------------------------------------------------------')
disp(' ')
disp(['Distance ran     : ', num2str(total_distance),'m']);
disp(['Total Time       : ', num2str(round(maxtime/60,2)),'mins']);
disp(['Steps Taken      : ', num2str(steps_taken),'steps']);
disp(['Average speed    : ', num2str(total_distance/maxtime,2),'m/s']);



% Set the assumed stride length in meters
stride_length = 0.8;
% Calculate the steps taken
steps_taken = round(total_distance / stride_length,0);

figure
plot(timestamp,[0,distElapsed])
title('Distance traveled');
xlabel('Time (seconds)');
ylabel('Distance covered (m)');
grid on

figure
plot(timestamp,[0,velocity'])
title('Speed Graph (m/s)');
xlabel('Time (seconds)');
ylabel('Speed (m/s)');
grid on

figure
geoplot(lat,lon,'-*')
geobasemap streets