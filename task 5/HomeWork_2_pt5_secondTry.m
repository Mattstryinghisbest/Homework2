%revised/works now slimed down to. 
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
