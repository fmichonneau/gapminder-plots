# Assignments

x <- 150
y <- log(x)
log <- 10

## Plotting
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv",
              "data/gapminder-FiveYearData.csv")
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

library(ggplot2)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

## Modify the code, to plot the change in life expectancy through time

ggplot(gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_point()

ggplot(gapminder, aes(x = year, y = lifeExp, by = country, color = continent)) +
  geom_line()

ggplot(gapminder, aes(x = year, y = lifeExp, by = country)) +
  geom_point(color = "yellow") +
  geom_line(aes(color = continent))

## transformation and statistics

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color=continent), alpha = .3) + scale_x_log10() +
  geom_smooth(method = "lm")

## change the color of the points (all points of the same color)
## bonus: change the color of the trend line

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "blue", aes(color=continent), alpha = .3) + scale_x_log10() +
  geom_smooth(color=rgb(25,0,6, maxColorValue = 255), method = "lm")

## change the shape of the points (1 shape for each continent)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color=continent, shape=continent), alpha = .3) + scale_x_log10() +
  geom_smooth(method = "lm")


## bug? in the scale
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color=continent)) +
  geom_point(aes(alpha = rev(year))) + scale_x_log10()

### Data frames

gapminder
dim(gapminder)
nrow(gapminder)
ncol(gapminder)
str(gapminder)

gapminder$country
gapminder$lifeExp

le <- gapminder$lifeExp

str(le)
class(le)

country <- gapminder$country
class(country)

## cat data
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/feline-data.csv",
              "data/feline-data.csv")
cats <- read.csv("data/feline-data.csv")

cats$weight * 2

paste("My cat is", cats$coat)

cats$coat + cats$weight

cat_name <- c("booboo", "pongo", "holly")
class(cat_name)

cats <- data.frame(
  name = cat_name,
  coat = cats$coat,
  weight = cats$weight,
  likes_string = cats$likes_string,
  stringsAsFactors = FALSE
)

cats <- read.csv("data/feline-data.csv", stringsAsFactors = FALSE)
str(cats)

combine_vector <- c(2, 6, 3)
combine_vector <- c(2L, 6L, 3L)

combine_vector <- integer(3)
combine_vector[1] <- 2

combine_vector <- c(2, "cat", 3)
class(combine_vector)

quiz_vector <- c(TRUE, FALSE, TRUE)
class(quiz_vector)

quiz_vector <- c(quiz_vector, FALSE)
quiz_vector <- c(TRUE, quiz_vector)

## why sum of quiz_vector is equal to 3?

cats$weight > 3

sum(cats$weight) > 3
mean(cats$weight) > 3

## Subsetting
cat_name[2]
cat_name[c(1, 3)]
cat_name[c(2, 2, 3, 1, 3, 2)]

cat_name[c(TRUE, FALSE, TRUE)]
grepl("^p", cat_name)
cat_name[grepl("^p", cat_name)]

cat_name[-2]
cat_name[-c(1, 3)]

cats[1, ]
cats[, 2]
cats[3, 1]

test_eq <- c(1, 2, 3, 2, 1)

## 1. subset the data frame to only include the cats who like strings
cats$likes_string == 1
cats[cats$likes_string == 1, ]

## 2. name of the cats that weight less than 3 pounds
## bonus: find 3 ways of doing this
weight <- c(cats$weight < 3)
cat_name[weight]

cat_name <- cbind(
  name = cat_name,
  cats
)

cat_name[cat_name$weight < 3, "name"]

tbl_country <- table(gapminder$country)[1:6]
str(tbl_country)
names(tbl_country)

names(tbl_country) == "Australia"
tbl_country[names(tbl_country) == "Australia"]

tbl_country[names(tbl_country) == "Australia" | 
              names(tbl_country) == "Argentina" ]

tbl_country[names(tbl_country) %in% c("Australia", "Argentina", "Albania")]

## complete this statement to select 6 countries
## in the gapminder dataset
sub_gapminder <- gapminder[ gapminder$country %in% 
                              c("Australia", "Argentina",
                                "Albania", "Italy", "Canada",
                                "Mexico"), ]

## how many rows are in this new data set?
