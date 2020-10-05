library(tidyverse)

g <- netflix %>% 
  filter(!is.na(release_year)) %>% 
  ggplot(data = .) +
  geom_bar(aes(x = release_year), 
           stat = "count", fill = "purple") +
  labs(title = "Bar Plot of Netflix Movie/TV Release Years",
       x = "Year",
       y = "Frequency")

aspect_ratio <- 2
height <- 7
ggsave("image3.png", g, height = 7 , width = 7 * aspect_ratio)
