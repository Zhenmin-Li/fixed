m2 <- lm(num_seasons ~ release_year, data = tv)
summary(m2)
b <- coef(m2)[1]
m <- coef(m2)[2]

plot(tv$release_year, tv$num_seasons,
     main = "Number of Seasons by Release Year",
     xlab = "Release Year", ylab = "Number of Seasons")
lines(c(1920, 2040), c(m*1920 + b, m*2040 + b))

plot(tv$release_year, m2$residuals,
     main = "Residual Plot for Model 2",
     xlab = "Release Year", ylab = "Residuals")
lines(c(1920, 2040), c(0, 0))