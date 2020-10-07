library(tidyverse)

g <- tv %>% 
  filter(!is.na(duration)) %>% 
  filter(release_year > 1980) %>% 
  # filter(rating %in% c("TV-PG", "TV-14", "TV-MA", "TV-G")) %>% 
  ggplot(data = .) +
  geom_point(aes(x = release_year, y = num_seasons, 
                 color = rating)) +
  geom_smooth(aes(x = release_year, y = num_seasons), se = T) +
  geom_vline(aes(xintercept = 2005)) +
  labs(title = "Scatterplot of Number of Seasons of \
  Netflix TV Shows By Release Year",
       x = "Release Year",
       y = "Number of Seasons") # +
  # facet_wrap(~rating)

aspect_ratio <- 1.8
height <- 7
ggsave("Artifacts/image4.png", g, height = 7 , width = 7 * aspect_ratio)
