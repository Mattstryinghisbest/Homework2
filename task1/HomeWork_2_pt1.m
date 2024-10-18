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
    
    fprintf('the year is %d the growth was %f \n', i, pop_data(1,i), pop_data(2,i))
end