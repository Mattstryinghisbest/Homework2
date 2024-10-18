%% Task 1: Population Growth Rate
% a) Create a row vector `population` with the data
population = [5000, 5200, 5350, 5600, 5800];

% b) Calculate the year-over-year growth rate
growth_rate = (population(2:end) - population(1:end-1)) ./ population(1:end-1);

% c) Combine vectors into a matrix
pop_data = [population; [0, growth_rate]];  % Add 0 for the first year's growth rate

% d) Print a formatted table
fprintf('Year\tPopulation\tGrowth Rate\n');
fprintf('------------------------------------\n');
for i = 1:length(population)
    if i == 1
        fprintf('%d\t%d\t\t%.2f%%\n', i, pop_data(1, i), 0);
    else
        fprintf('%d\t%d\t\t%.2f%%\n', i, pop_data(1, i), pop_data(2, i) * 100);
    end
end

%% Task 2: Caesar Cipher
% a) Function to perform Caesar cipher encryption
function encrypted_message = caesar_cipher(message, shift)
    encrypted_message = '';  % Initialize encrypted message
    for i = 1:length(message)
        char_code = double(message(i)) - 97;  % Get alphabet position (0-based)
        new_code = mod(char_code + shift, 26);  % Apply the shift
        encrypted_message(i) = char(new_code + 97);  % Convert back to character
    end
end

% b) Main script to encrypt a message
message = input('Enter a message to encrypt (lowercase letters): ', 's');
shift = input('Enter a shift value (1-25): ');
encrypted = caesar_cipher(message, shift);
fprintf('Original Message: %s\n', message);
fprintf('Encrypted Message: %s\n', encrypted);

%% Task 3: Weather Data Processing
% a) Read the data from 'weather_data.txt'
weather_data = readcell('weather_data.txt', 'Delimiter', ',');

% b) Extract numerical data for temperature, humidity, and precipitation
temperature = cell2mat(weather_data(2:end, 2));  % Column 2
humidity = cell2mat(weather_data(2:end, 3));     % Column 3
precipitation = cell2mat(weather_data(2:end, 4)); % Column 4

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

%% Task 4: Solar System Visualization
% a) Define planet distances (AU) and sizes (relative to Earth)
planet_distances = [0.39, 0.72, 1.00, 1.52, 5.20, 9.58, 19.22, 30.05];
planet_sizes = [0.38, 0.95, 1.00, 0.53, 11.21, 9.45, 4.01, 3.88];

% b) Create scatter plot and bar chart
figure;

% Subplot 1: Scatter plot of distances vs. sizes
subplot(1, 2, 1);
scatter(planet_distances, planet_sizes, 100, 'filled');  % Scatter plot
xlabel('Distance from Sun (AU)');
ylabel('Size (Relative to Earth)');
title('Planet Distances vs. Sizes');
grid on;

% Subplot 2: Bar chart of distances
subplot(1, 2, 2);
bar(planet_distances);
xlabel('Planet');
ylabel('Distance from Sun (AU)');
title('Distance of Planets from the Sun');
grid on;

% c) Save the figure as an image
saveas(gcf, 'solar_system_visualization.png');

%% Task 5: Stock Market Analysis
% a) Read stock data from 'stock_data.txt'
data = table2array(readtable('Stock_data.txt'));  % Convert table to array

average_price = mean(data);     % Calculate the average price
highest_price = max(data);      % Calculate the highest price
lowest_price = min(data);       % Calculate the lowest price
price_increase_days = sum(diff(data) > 0);  % Count the number of days the price increased

% Print the stock analysis results to the console
fprintf('Average Closing Price: %.2f\n', average_price);
fprintf('Highest Closing Price: %.2f\n', highest_price);
fprintf('Lowest Closing Price: %.2f\n', lowest_price);
fprintf('Number of Days Price Increased: %d\n', price_increase_days);

% Plot the data
figure;  % Create a new figure
plot(data, 'b-', 'LineWidth', 2);  % Plot the stock prices
hold on;
yline(average_price, 'r--', 'Average price', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right');
yline(highest_price, 'g--', 'Highest price', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right');
yline(lowest_price, 'm--', 'Lowest price', 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right');
xlabel('Day');
ylabel('Closing Price');
title('Daily Closing Prices of Stock');
legend('Closing Prices', 'Average Price', 'Highest Price', 'Lowest Price');
grid on;

% Save the plot as a PNG file
saveas(gcf, 'stock_analysis.png');

% Write the stock analysis summary to a text file
fileID = fopen('stock_summary.txt', 'w');
fprintf(fileID, 'Stock Analysis Summary:\n');
fprintf(fileID, 'Average Closing Price: %.2f\n', average_price);
fprintf(fileID, 'Highest Closing Price: %.2f\n', highest_price);
fprintf(fileID, 'Lowest Closing Price: %.2f\n', lowest_price);
fprintf(fileID, 'Number of Days Price Increased: %d\n', price_increase_days);
fclose(fileID);
