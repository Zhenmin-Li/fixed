netflix <- read.csv("derived_data/netflix.csv")
movies <- read.csv("derived_data/movies.csv")
tv <- read.csv("derived_data/tv.csv")

m2 <- lm(num_seasons ~ release_year, data = tv)
saveRDS(m2, "derived_data/linear_model2.rds")

b <- coef(m2)[1]
m <- coef(m2)[2]
tv$residuals <- m2$residuals

p1 <- ggplot(data = tv, aes(x = release_year, y = num_seasons)) +
  labs(title = "Number of Seasons by Release Year",
       x = "Release Year", y = "Number of Seasons") +
  geom_point(aes(color = "purple"))

ggsave("derived_data/model2_plot1.png", p1)

p2 <- ggplot(data = tv, aes(x = release_year, y = residuals)) +
  labs(title = "Residual Plot for Model 2",
       x = "Release Year", y = "Residuals") +
  geom_point(aes(color = "purple")) 

ggsave("derived_data/model2_plot2.png", p2)
