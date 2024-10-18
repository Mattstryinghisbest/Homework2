%% Task 3: Weather Data Processing
% a) Read the data from 'temperature.txt' using readtable
weather_data = readtable('weather_data.txt');

% b) Extract numerical data for temperature, humidity, and precipitation
% Assuming column 2 is 'Temperature', column 3 is 'Humidity', and column 4 is 'Precipitation'
temperature = weather_data{:, 2};  % Column 2 for temperature
humidity = weather_data{:, 3};     % Column 3 for humidity
precipitation = weather_data{:, 4}; % Column 4 for precipitation

% c) Calculate averages and total precipitation
avg_temperature = mean(temperature);
avg_humidity = mean(humidity);
total_precipitation = sum(precipitation);

% d) Write statistics to 'weather_summary.txt'
fileID = fopen('weather_summary.txt', 'w');
fprintf(fileID, 'Average Temperature: %.2f\n', avg_temperature);
fprintf(fileID, 'Average Humidity: %.2f\n', avg_humidity);
fprintf(fileID, 'Total Precipitation: %.2f\n', total_precipitation);
fclose(fileID);