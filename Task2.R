# Basic Data Visualization in R
# Climate Change: Earth Surface Temperature Data

# Load required libraries
library(ggplot2)
library(dplyr)
library(readr)

# Load temperature dataset (adjust path as needed)
temperature_data <- read_csv("GlobalTemperatures.csv")

# Clean and prepare data for line chart
temperature_data_clean <- temperature_data %>%
  filter(!is.na(LandAverageTemperature)) %>%
  mutate(dt = as.Date(dt))

# Create line chart: Global temperature over time
line_plot <- ggplot(temperature_data_clean, aes(x = dt, y = LandAverageTemperature)) +
  geom_line(color = "darkred") +
  labs(title = "Global Land Average Temperature Over Time",
       x = "Year",
       y = "Temperature (°C)") +
  theme_minimal()

# Save line chart
ggsave("global_temperature_line_chart.png", plot = line_plot, width = 8, height = 5)

# Create dummy CO2 emissions data (for scatter plot example)
set.seed(42)
co2_data <- data.frame(
  CO2_emissions = runif(100, 300, 450),               # CO2 in ppm
  Temperature_Anomaly = rnorm(100, mean = 0.8, sd = 0.2) # temp anomaly
)

# Create scatter plot: CO2 emissions vs. temperature anomaly
scatter_plot <- ggplot(co2_data, aes(x = CO2_emissions, y = Temperature_Anomaly)) +
  geom_point(color = "steelblue", alpha = 0.7) +
  labs(title = "CO₂ Emissions vs. Temperature Anomaly",
       x = "CO₂ Emissions (ppm)",
       y = "Temperature Anomaly (°C)") +
  theme_minimal()

# Save scatter plot
ggsave("co2_vs_temperature_anomaly.png", plot = scatter_plot, width = 8, height = 5)

