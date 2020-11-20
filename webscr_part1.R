# Collected data into a dataframe by scrapping web using following libraries 
library(rvest)
library(xml2)
library(stringr)

#webpage being scrapped
url <- 'http://books.toscrape.com/catalogue/category/books_1/index.html'
website_html <- read_html(url)

#Getting the titles
title_html <- html_nodes(website_html, 'h3')
title_text <- html_text(title_html)

class(title_text)
title_text
title_html

# Getting prices
price_html <- html_nodes(website_html, '.price_color')
price_text <- html_text(price_html)

class(price_text)
price_text

#getting rid of symbol using gsub function
price_text <- gsub('£','',price_text)
price_text

# converting character to numeric
price_text <- as.numeric(price_text)
price_text

# Finding average price
mean(price_text)

# Examining availability of stock
availability_html <- html_nodes(website_html, '.instock.availability')
availability_text <- html_text(availability_html)

class(availability_text)
availability_text
availability_text <- gsub('\n','',availability_text)
availability_text

# Putting everything together
books_data <- data.frame(Title=title_text,
                         Price=price_text,
                         Availability=availability_text)
books_data
