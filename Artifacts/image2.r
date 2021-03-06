library(tidyverse)

g <- netflix %>% 
  filter(type == "TV Show" & ! is.na(duration) & as.numeric(substr(duration, 1, 2)) < 10) %>% 
  ggplot(data = .) +
  geom_bar(aes(as.factor(duration)), 
           stat = "count", fill = "purple") +
  labs(title = "Bar Plot of Durations of TV Shows on Netflix",
       x = "Duration",
       y = "Frequency") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

aspect_ratio <- 2
height <- 7
ggsave("Artifacts/image2.png", g, height = 7 , width = 7 * aspect_ratio)
