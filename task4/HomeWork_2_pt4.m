% Solar System Visualization
% Define the average distances of the planets from the Sun (in AU)
planet_distances = [0.39, 0.72, 1.00, 1.52, 5.20, 9.58, 19.22, 30.06]; % Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
% Define the relative sizes of the planets (Earth = 1)
planet_sizes = [0.38, 0.95, 1.00, 0.53, 11.21, 9.45, 4.01, 3.88]; % Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune

% Define planet names for labeling
planet_names = {'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'};

% Create a figure with two subplots
figure;

% First subplot: Scatter plot of planet distances vs. planet sizes
subplot(2, 1, 1); % 2 rows, 1 column, 1st subplot
scatter(planet_distances, planet_sizes * 100, 100, 'filled'); % Multiply sizes for better visibility
title('Planet Distances vs. Sizes');
xlabel('Distance from Sun (AU)');
ylabel('Relative Size (Earth = 1)');
grid on;

% Add planet names as labels
text(planet_distances, planet_sizes * 100, planet_names, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

% Second subplot: Bar chart of planet distances
subplot(2, 1, 2); % 2 rows, 1 column, 2nd subplot
bar(planet_distances);
title('Planet Distances from the Sun');
xlabel('Planets');
ylabel('Distance (AU)');
set(gca, 'XTickLabel', planet_names); % Set x-axis labels to planet names
grid on;

% Save the figure as an image file
saveas(gcf, 'solar_system_visualization.png');

% Display message indicating completion
disp('Solar system visualization saved as solar_system_visualization.png');
