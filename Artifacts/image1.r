library(tidyverse)

ggplot(data = netflix) +
  geom_histogram(aes(type), stat = "count") +
  labs(title = "Histogram of Type of Media on Netflix",
       x = "Type",
       y = "Frequency")

ggsave("image1.png")