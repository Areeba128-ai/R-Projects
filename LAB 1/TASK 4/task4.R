# Install xts and zoo (Uncomment if not installed)
install.packages("xts")
install.packages("zoo")

# Load libraries
library(xts)
library(zoo)

# Create a sample time-series dataset
dates <- as.Date("2025-01-01") + 0:9  # 10 days from 2025-01-01
values <- c(10, 12, 15, 14, 13, 17, 19, 18, 16, 20)  # Sample data

# Create an xts object
time_series <- xts(values, order.by=dates)

# Plot the time series
plot(time_series, main="Time-Series Data", col="blue", type="o", xlab="Date", ylab="Values")
