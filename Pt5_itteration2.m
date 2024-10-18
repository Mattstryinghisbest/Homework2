% Read the stock data from 'stock_data.txt'
data = readtable('Stock_data.txt');

% Check the structure and columns of the table to verify the column name
disp(data.Properties.VariableNames);  % Show available columns

% Extract the closing prices (replace 'ClosingPrice' with the actual column name you found)
closing_prices = data.ClosingPrice;  % For example, use 'Price' if that's the correct name

% Calculate statistics
average_price = mean(closing_prices);
highest_price = max(closing_prices);
lowest_price = min(closing_prices);
days_increased = sum(diff(closing_prices) > 0);  % Direct calculation

% Display calculated statistics
fprintf('Average Closing Price: $%.2f\n', average_price);
fprintf('Highest Closing Price: $%.2f\n', highest_price);
fprintf('Lowest Closing Price: $%.2f\n', lowest_price);
fprintf('Number of Days Stock Price Increased: %d\n', days_increased);

% Create a line plot for daily closing prices
figure;
plot(closing_prices, '-o', 'LineWidth', 2);  % Plot the array directly
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

% Display completion message
disp('Stock market analysis completed. Results saved.');
