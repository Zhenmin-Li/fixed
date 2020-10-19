# m <- lm(num_seasons ~ country + release_year + rating + listed_in, 
#         data = tv)
# summary(m)
netflix <- read.csv("derived_data/netflix.csv")
movies <- read.csv("derived_data/movies.csv")
tv <- read.csv("derived_data/tv.csv")

length(unique(tv$country)) * length(unique(tv$rating)) * length(unique(tv$listed_in))

m <- lm(num_seasons ~ release_year + rating, data = tv)

saveRDS(m, "derived_data/linear_model1.rds")
