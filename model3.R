netflix <- read.csv("derived_data/netflix.csv")
movies <- read.csv("derived_data/movies.csv")
tv <- read.csv("derived_data/tv.csv")

m3 <- loess(num_seasons ~ release_year, data = tv)
summary(m3)

hist(tv$num_seasons, col = "pink",
     main = "Histogram of Number of Seasons",
     xlab = "Number of Seasons")

savePlot("derived_data/model3_image.png")