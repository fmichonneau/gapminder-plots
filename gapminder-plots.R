download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv",
              "data/gapminder-FiveYears.csv")
gapminder <- read.csv("data/gapminder-FiveYears.csv")

library(ggplot2)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent)) +
  scale_x_log10() +
  geom_smooth(method="lm", color="red")

japan_gapminder <- gapminder[gapminder$country == "Japan", ]

ggplot(japan_gapminder, aes(x = year, y = lifeExp)) +
  geom_line(color = "coral") +
  ylab("Life expectancy") + xlab("Year")
