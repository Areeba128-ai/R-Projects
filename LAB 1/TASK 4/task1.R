# Install lubridate (Uncomment if not installed)
install.packages("lubridate")

# Load the library
library(lubridate)

# Parse different date formats
date1 <- ymd("2025-03-17")
date2 <- dmy("17-03-2025")
date3 <- mdy("March 17, 2025")

# Format dates into different styles
formatted_date1 <- format(date1, "%A, %d %B %Y") # Example: Monday, 17 March 2025
formatted_date2 <- format(date2, "%d-%m-%Y") # Example: 17-03-2025

# Print results
print(formatted_date1)
print(formatted_date2)
