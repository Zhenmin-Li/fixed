---
title: "Project Report"
output: pdf_document
---

We analyze the Netflix dataset.


```r
netflix <- read.csv("derived_data/netflix.csv")
movies <- read.csv("derived_data/movies.csv")
tv <- read.csv("derived_data/tv.csv")

head(netflix)
```

```
##    show_id    type                                   title
## 1 81145628   Movie Norm of the North: King Sized Adventure
## 2 80117401   Movie              Jandino: Whatever it Takes
## 3 70234439 TV Show                      Transformers Prime
## 4 80058654 TV Show        Transformers: Robots in Disguise
## 5 80125979   Movie                            #realityhigh
## 6 80163890 TV Show                                 Apaches
##                   director
## 1 Richard Finn, Tim Maltby
## 2                         
## 3                         
## 4                         
## 5         Fernando Lebrija
## 6                         
##                                                                                                                                                                                 cast
## 1                                        Alan Marriott, Andrew Toth, Brian Dobson, Cole Howard, Jennifer Cameron, Jonathan Holmes, Lee Tockar, Lisa Durupt, Maya Kay, Michael Dobson
## 2                                                                                                                                                                   Jandino Asporaat
## 3 Peter Cullen, Sumalee Montano, Frank Welker, Jeffrey Combs, Kevin Michael Richardson, Tania Gunadi, Josh Keaton, Steve Blum, Andy Pessoa, Ernie Hudson, Daran Norris, Will Friedle
## 4                                                           Will Friedle, Darren Criss, Constance Zimmer, Khary Payton, Mitchell Whitfield, Stuart Allan, Ted McGinley, Peter Cullen
## 5           Nesta Cooper, Kate Walsh, John Michael Higgins, Keith Powers, Alicia Sanz, Jake Borelli, Kid Ink, Yousef Erakat, Rebekah Graf, Anne Winters, Peter Gilroy, Patrick Davis
## 6                                                                                                      Alberto Ammann, Eloy Azorín, Verónica Echegui, Lucía Jiménez, Claudia Traisac
##                                    country        date_added release_year
## 1 United States, India, South Korea, China September 9, 2019         2019
## 2                           United Kingdom September 9, 2016         2016
## 3                            United States September 8, 2018         2013
## 4                            United States September 8, 2018         2016
## 5                            United States September 8, 2017         2017
## 6                                    Spain September 8, 2017         2016
##     rating duration
## 1    TV-PG   90 min
## 2    TV-MA   94 min
## 3 TV-Y7-FV 1 Season
## 4    TV-Y7 1 Season
## 5    TV-14   99 min
## 6    TV-MA 1 Season
##                                                           listed_in
## 1                                Children & Family Movies, Comedies
## 2                                                   Stand-Up Comedy
## 3                                                          Kids' TV
## 4                                                          Kids' TV
## 5                                                          Comedies
## 6 Crime TV Shows, International TV Shows, Spanish-Language TV Shows
##                                                                                                                                            description
## 1         Before planning an awesome wedding for his grandfather, a polar bear king must take back a stolen artifact from an evil archaeologist first.
## 2    Jandino Asporaat riffs on the challenges of raising kids and serenades the audience with a rousing rendition of "Sex on Fire" in his comedy show.
## 3         With the help of three human allies, the Autobots once again protect Earth from the onslaught of the Decepticons and their leader, Megatron.
## 4                       When a prison ship crash unleashes hundreds of Decepticons on Earth, Bumblebee leads a new Autobot force to protect humankind.
## 5 When nerdy high schooler Dani finally attracts the interest of her longtime crush, she lands in the cross hairs of his ex, a social media celebrity.
## 6             A young journalist is forced into a life of crime to save his father and family in this series based on the novel by Miguel Sáez Carral.
```

This can be done best by breaking it up into the TV and movies datasets separately.


```r
head(tv)
```

```
##    show_id    type                            title director
## 1 70234439 TV Show               Transformers Prime         
## 2 80058654 TV Show Transformers: Robots in Disguise         
## 3 80163890 TV Show                          Apaches         
## 4 80117902 TV Show                     Fire Chasers         
## 5 80244601 TV Show                  Castle of Stars         
## 6 80190843 TV Show                   First and Last         
##                                                                                                                                                                                   cast
## 1   Peter Cullen, Sumalee Montano, Frank Welker, Jeffrey Combs, Kevin Michael Richardson, Tania Gunadi, Josh Keaton, Steve Blum, Andy Pessoa, Ernie Hudson, Daran Norris, Will Friedle
## 2                                                             Will Friedle, Darren Criss, Constance Zimmer, Khary Payton, Mitchell Whitfield, Stuart Allan, Ted McGinley, Peter Cullen
## 3                                                                                                        Alberto Ammann, Eloy Azorín, Verónica Echegui, Lucía Jiménez, Claudia Traisac
## 4                                                                                                                                                                                     
## 5 Chaiyapol Pupart, Jintanutda Lummakanon, Worrawech Danuwong, Ornjira Lamwilai, Yong Armchair, Keerati Mahapreukpong, Akarat Nimitchai, Kornpassorn Duaysianklao, Nattapong Chartpong
## 6                                                                                                                                                                                     
##         country        date_added release_year   rating duration
## 1 United States September 8, 2018         2013 TV-Y7-FV 1 Season
## 2 United States September 8, 2018         2016    TV-Y7 1 Season
## 3         Spain September 8, 2017         2016    TV-MA 1 Season
## 4 United States September 8, 2017         2017    TV-MA 1 Season
## 5               September 7, 2018         2015    TV-14 1 Season
## 6               September 7, 2018         2018    TV-MA 1 Season
##                                                           listed_in
## 1                                                          Kids' TV
## 2                                                          Kids' TV
## 3 Crime TV Shows, International TV Shows, Spanish-Language TV Shows
## 4                                   Docuseries, Science & Nature TV
## 5            International TV Shows, Romantic TV Shows, TV Comedies
## 6                                                        Docuseries
##                                                                                                                                           description
## 1        With the help of three human allies, the Autobots once again protect Earth from the onslaught of the Decepticons and their leader, Megatron.
## 2                      When a prison ship crash unleashes hundreds of Decepticons on Earth, Bumblebee leads a new Autobot force to protect humankind.
## 3            A young journalist is forced into a life of crime to save his father and family in this series based on the novel by Miguel Sáez Carral.
## 4 As California's 2016 fire season rages, brave backcountry firefighters race to put out the flames, protect homes and save lives in this docuseries.
## 5                 As four couples with different lifestyles go through the ebbs and flows of joy and sorrow, each must learn how to live a good life.
## 6      Take an intimate look at the emotionally charged first and last days of new and soon-to-be released inmates at Georgia's Gwinnett County Jail.
##   num_seasons
## 1           1
## 2           1
## 3           1
## 4           1
## 5           1
## 6           1
```

```r
colnames(tv)
```

```
##  [1] "show_id"      "type"         "title"        "director"     "cast"        
##  [6] "country"      "date_added"   "release_year" "rating"       "duration"    
## [11] "listed_in"    "description"  "num_seasons"
```

With the data on TV shows, we're interested in possibly predicting the number of seasons from the other variables. Some of these variables are highly unlikely to overfit. For example, title, director, cast, and description all possibly uniquely identify the TV show. The useful predictor variables here appear to be country, release year, and listed in and/or rating. Let's fit a simple linear regression model and see how well it predicts the number of seasons from those 4 variables:


```r
# m <- lm(num_seasons ~ country + release_year + rating + listed_in, 
#         data = tv)
# summary(m)
length(unique(tv$country)) * length(unique(tv$rating)) * length(unique(tv$listed_in))
```

```
## [1] 394320
```

This "simple" model just estimated 394,320 parameters because we didn't think about how many different countries and categories of TV there are. Let's try a much simpler model that takes only rating into account:


```r
m <- lm(num_seasons ~ release_year + rating, data = tv)
summary(m)
```

```
## 
## Call:
## lm(formula = num_seasons ~ release_year + rating, data = tv)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.2203 -0.8172 -0.6259  0.2314 13.2152 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)  
## (Intercept)    33.673085  13.133492   2.564   0.0104 *
## release_year   -0.016223   0.006496  -2.497   0.0126 *
## ratingG         0.032446   1.983136   0.016   0.9869  
## ratingNR        1.830387   1.214523   1.507   0.1320  
## ratingPG        1.064892   1.983264   0.537   0.5914  
## ratingR         0.024334   1.619218   0.015   0.9880  
## ratingTV-14     0.849672   1.146699   0.741   0.4588  
## ratingTV-G      1.043008   1.161414   0.898   0.3693  
## ratingTV-MA     0.674607   1.146811   0.588   0.5564  
## ratingTV-PG     0.776426   1.149192   0.676   0.4994  
## ratingTV-Y      0.910186   1.156164   0.787   0.4312  
## ratingTV-Y7     0.946281   1.156380   0.818   0.4133  
## ratingTV-Y7-FV  0.978051   1.161688   0.842   0.3999  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.619 on 1956 degrees of freedom
## Multiple R-squared:  0.01312,	Adjusted R-squared:  0.007061 
## F-statistic: 2.166 on 12 and 1956 DF,  p-value: 0.01113
```

Interestingly, this model seems to suggest that rating is NOT a significant predictor for number of seasons. So, we will exclude it from the model, and instead examine by country.


```r
m2 <- lm(num_seasons ~ release_year, data = tv)
summary(m2)
```

```
## 
## Call:
## lm(formula = num_seasons ~ release_year, data = tv)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.6100 -0.7702 -0.7298  0.2702 13.2702 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  42.527776  12.699811   3.349 0.000827 ***
## release_year -0.020217   0.006301  -3.209 0.001355 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.621 on 1967 degrees of freedom
## Multiple R-squared:  0.005207,	Adjusted R-squared:  0.004701 
## F-statistic: 10.29 on 1 and 1967 DF,  p-value: 0.001355
```

```r
b <- coef(m2)[1]
m <- coef(m2)[2]

plot(tv$release_year, tv$num_seasons,
     main = "Number of Seasons by Release Year",
     xlab = "Release Year", ylab = "Number of Seasons")
lines(c(1920, 2040), c(m*1920 + b, m*2040 + b))
```

![](Project-Report_files/figure-latex/unnamed-chunk-5-1.pdf)<!-- --> 

```r
plot(tv$release_year, m2$residuals,
     main = "Residual Plot for Model 2",
     xlab = "Release Year", ylab = "Residuals")
lines(c(1920, 2040), c(0, 0))
```

![](Project-Report_files/figure-latex/unnamed-chunk-5-2.pdf)<!-- --> 

This (clearly) does not satisfy the assumptions of linear regression that have to do with the error terms being normally distributed with mean zero and constant variance. Let's see if we can get a better fit by using a LOESS or spline model.


```r
m3 <- loess(num_seasons ~ release_year, data = tv)
summary(m3)
```

```
## Call:
## loess(formula = num_seasons ~ release_year, data = tv)
## 
## Number of Observations: 1969 
## Equivalent Number of Parameters: 6.02 
## Residual Standard Error: 1.627 
## Trace of smoother matrix: 6.61  (exact)
## 
## Control settings:
##   span     :  0.75 
##   degree   :  2 
##   family   :  gaussian
##   surface  :  interpolate	  cell = 0.2
##   normalize:  TRUE
##  parametric:  FALSE
## drop.square:  FALSE
```

The model seems to be completely dominated by a majority of TV shows with few seasons. How many shows run for only 1 season?


```r
hist(tv$num_seasons, col = "pink",
     main = "Histogram of Number of Seasons",
     xlab = "Number of Seasons")
```

![](Project-Report_files/figure-latex/unnamed-chunk-7-1.pdf)<!-- --> 

It appears that the vast majority of shows on Netflix run for 1 season. 


# Future Directions

This analysis is not super interesting. In the future, I would maybe try to learn some simple text analysis and/or try to merge this data with movie/tv ratings to see whether I can predict them.
