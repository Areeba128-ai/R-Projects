# Install rvest (Uncomment if not installed)
install.packages("rvest")

# Load the library
library(rvest)

# Define the URL to scrape
url <- "https://www.digitalsilk.com/digital-trends/best-small-business-websites/"  # Replace with a real webpage

# Read the webpage
webpage <- read_html(url)

# Extract specific data (modify CSS selectors based on webpage structure)
titles <- webpage %>% html_nodes("h2") %>% html_text()
paragraphs <- webpage %>% html_nodes("p") %>% html_text()

# Print extracted data
print(titles)
print(paragraphs)
