library(tidyverse)

g <- tv %>% 
  filter(!is.na(duration)) %>% 
  ggplot(data = .) +
  geom_point(aes(x = release_year, y = num_seasons),
             color = "purple") +
  labs(title = "Scatterplot of Number of Seasons of \
  Netflix TV Shows By Release Year",
       x = "Release Year",
       y = "Number of Seasons")

aspect_ratio <- 2
height <- 7
ggsave("image4.png", g, height = 7 , width = 7 * aspect_ratio)
