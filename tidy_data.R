library(tidyverse)

netflix <- read.csv("source_data/netflix_titles.csv")

# Do your data cleanup here!

movies <- netflix %>% filter(type == "Movie")

print('do it')

tv <- netflix %>% 
  filter(type == "TV Show") %>% 
  mutate(num_seasons = as.numeric(substr(duration, 1, 2)))

# Output the cleaned data

write_csv(netflix, "derived_data/netflix.csv")
write_csv(movies, "derived_data/movies.csv")
write_csv(tv, "derived_data/tv.csv")

