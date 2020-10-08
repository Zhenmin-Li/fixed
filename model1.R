# m <- lm(num_seasons ~ country + release_year + rating + listed_in, 
#         data = tv)
# summary(m)
length(unique(tv$country)) * length(unique(tv$rating)) * length(unique(tv$listed_in))

m <- lm(num_seasons ~ release_year + rating, data = tv)
summary(m)

