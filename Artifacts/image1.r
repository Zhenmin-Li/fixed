library(tidyverse)

ggplot(data = netflix) +
  geom_histogram(aes(type), 
                 stat = "count", fill = "purple") +
  labs(title = "Histogram of Type of Media on Netflix",
       x = "Type",
       y = "Frequency")

aspect_ratio <- 1.5
height <- 7
ggsave("Artifacts/image1.png", height = 7 , width = 7 * aspect_ratio)
