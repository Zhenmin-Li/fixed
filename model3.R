m3 <- loess(num_seasons ~ release_year, data = tv)
summary(m3)

hist(tv$num_seasons, col = "pink",
     main = "Histogram of Number of Seasons",
     xlab = "Number of Seasons")