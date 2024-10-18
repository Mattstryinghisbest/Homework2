%too clunky nonfunctional 
% Read the stock data from 'stock_data.txt'
data = readtable('Stock_data.txt');

% Calculate statistics
average_price = mean(data);
highest_price = max(data);
lowest_price = min(data);

% Calculate number of days the stock price increased from the previous day
price_changes = diff(data);
days_increased = sum(price_changes > 0);

% Print the calculated statistics with the corresponding values
fprintf ('Average Closing Price: $%.2f\n');
fprintf('Highest Closing Price: $%.2f\n');
fprintf('Lowest Closing Price: $%.2f\n');
fprintf('Number of Days Stock Price Increased: %d\n');


% Create a line plot for daily closing prices
figure;
plot(data, '-o', 'LineWidth', 2); % Daily closing prices
hold on;

% Add horizontal lines for average, highest, and lowest prices
yline(average_price, 'r--', 'Average Price', 'LabelHorizontalAlignment', 'left', 'LineWidth', 1.5);
yline(highest_price, 'g--', 'Highest Price', 'LabelHorizontalAlignment', 'left', 'LineWidth', 1.5);
yline(lowest_price, 'b--', 'Lowest Price', 'LabelHorizontalAlignment', 'left', 'LineWidth', 1.5);

% Add labels, title, and legend
xlabel('Days');
ylabel('Closing Price ($)');
title('Daily Closing Prices of Fictitious Stock');
legend('Closing Prices', 'Average Price', 'Highest Price', 'Lowest Price');
grid on;

% Save the plot as an image file
saveas(gcf, 'stock_analysis.png');

% Write summary to 'stock_summary.txt'
summaryFileID = fopen('stock_summary.txt', 'w');
fprintf(summaryFileID, 'Stock Market Analysis Summary\n');
fprintf(summaryFileID, 'Average Closing Price: $%.2f\n', average_price);
fprintf(summaryFileID, 'Highest Closing Price: $%.2f\n', highest_price);
fprintf(summaryFileID, 'Lowest Closing Price: $%.2f\n', lowest_price);
fprintf(summaryFileID, 'Number of Days Stock Price Increased: %d\n', days_increased);
fclose(summaryFileID);

% Display message indicating completion
disp('Stock market analysis completed. Results saved.');