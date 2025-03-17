# Install rvest (Uncomment if not installed)
install.packages("rvest")

# Load the library
library(rvest)

# Task 2: Scrape data from a webpage using rvest
url <- "https://www.bbc.com/news/articles/cj3eg3n11gvo" # Replace with actual URL
webpage <- read_html(url)
titles <- webpage %>% html_nodes("h2") %>% html_text()
cat("Scraped Titles:\n", titles, "\n")
