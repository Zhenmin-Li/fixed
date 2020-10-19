netflix <- read.csv("derived_data/netflix.csv")
movies <- read.csv("derived_data/movies.csv")
tv <- read.csv("derived_data/tv.csv")

m3 <- loess(num_seasons ~ release_year, data = tv)
saveRDS(m3, "derived_data/loess_model3.rds")

p <- ggplot(data = tv, aes(x = num_seasons)) +
  geom_histogram(fill = "pink") +
  labs(title = "Histogram of Number of Seasons",
       x = "Number of Seasons",
       y = "Frequency")

ggsave("derived_data/model3_image1.png", p)

p2 <- tv %>% filter(num_seasons > 1) %>% 
  ggplot(data = ., aes(x = num_seasons)) +
  geom_histogram(fill = "pink") +
  labs(title = "Histogram of Number of Seasons (Where # Seasons > 1)",
       x = "Number of Seasons",
       y = "Frequency")

ggsave("derived_data/model3_image2.png", p2)
