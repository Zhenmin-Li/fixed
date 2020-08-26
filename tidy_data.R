library(tidyverse)

netflix <- read.csv("source_data/netflix_titles.csv")

# Do your data cleanup here!



# Output the cleaned data

write_csv(netflix, "derived_data/netflix.csv")