library(tidyverse)

ggplot(data = netflix) +
  geom_histogram(aes(type), stat = "count") +
  labs(title = "Histogram of Type of Media on Netflix",
       x = "Type",
       y = "Frequency")

aspect_ratio <- 2.5
height <- 7
ggsave("image1.png", height = 7 , width = 7 * aspect_ratio)
