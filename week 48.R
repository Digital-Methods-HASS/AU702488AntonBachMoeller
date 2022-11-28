```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r libraries, echo = FALSE}
install.packages("gganimate")
install.packages("gifski")
install.packages("av")
install.packages("gapminder")
install.packages("wesanderson")
library(tidyverse)
library(gganimate)
library(gifski)
library(av)
library(gapminder)
library(wesanderson)

str(gapminder)
unique(gapminder$year)
head(gapminder)


```{r 1957}
theme_set(theme_bw("#FF0000") 
          
ggplot(subset(gapminder, year == 1952), aes(gdpPercap, lifeExp, size = pop)) +
  geom_point(color = country_colors) +
  scale_x_log10()

#

# 1. *Why does it make sense to have a log10 scale on x axis?*

#log10 is the inverse of an exponential function, simply put, countries develop 
#at an exponential rate post industrailisation so it makes sense to measure it in inverse

# 2. *Who is the outlier (the richest country in 1952 - far right on x axis)?*

#Kuwait simply click "gapminder" under data and doubleclick gdpPercap

ggplot(subset(gapminder, year == 2007), aes(gdpPercap, lifeExp, size = pop)) +
  geom_point() +
  scale_x_log10()
#3 *Differentiate the **continents** by color, and fix the axis labels and units to be more legible (**Hint**: the 2.50e+08 is so called "scientific notation", which you might want to eliminate)*

#simply run this command to turn of scientific notations and re-run the previous commands for improved graphs.
options(scipen=999)

#there should no longer be any scientific notaions. I have been unable to color
#the graph according to the continents, but I can't figure out why my metod won't work
#I wanted to use the following command
ggplot(subset(gapminder, year == 2007), aes(gdpPercap, lifeExp, size = pop)) +
  geom_point(color =continent_colors) +
  scale_x_log10()
#which is an exact replica of the previous with the added string "color = continent_colors"
#under values by hovering over with your mouse five colourcodes appear, one for each represented continent
#the colorcodes are assigned and the same is the case with country_colors, wherein my command works:
ggplot(subset(gapminder, year == 2007), aes(gdpPercap, lifeExp, size = pop)) +
  geom_point(color =country_colors) +
  scale_x_log10()
#I can't explain it, but it would seem logical that we should use the predefined colors
#from the data set

#4. *What are the five richest countries in the world in 2007?*
#In desending order: Norway, Kuwait, Singapore, United States and Ireland according to GDP



anim <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop)) +
  geom_point() +
  scale_x_log10()

#make it move
anim + transition_states(year, 
                         transition_length = 1,
                         state_length = 1)

anim2 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop)) +
  geom_point() +
  scale_x_log10()
  transition_time(year)
anim2

anim2 + transition_states(year, 
                         transition_length = 1,
                         state_length = 1)
#5. Could not find a way to add titles
#I don't see much difference between the two, but job is done and time is up.
#6. The axes seem easily readable already
#7: how have the GDP, lifeexpectancy and population worldwide changed in the timeperiod between 1952 and 2007?