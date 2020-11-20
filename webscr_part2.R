library(rvest)
library(xml2)
library(stringr)

url1 <- 'http://quotes.toscrape.com/'
website_html <- read_html(url1)

content_html <- html_nodes(website_html, '.text')
content_text <- html_text(content_html)

author_html <- html_node(website_html, '.author')
author_text <- html_text(author_html)

tags_html <- html_nodes(website_html, '.tags')
tags_text <- html_text(tags_html)

# Create a dataframe which carries information about every quote
quote_data <- data.frame(Content = content_text,
                         Author = author_text,
                         Tags = tags_text)
View(quote_data)
names(quote_data)
quote_data$Tags <- gsub('Tags:', '', quote_data$Tags)
quote_data$Tags <- gsub("\\s+", " ", quote_data$Tags)

#Quotes tagged as "love"
grep('love', quote_data$Tags)
as.character(quote_data[grep('love', quote_data$Tags),1])
