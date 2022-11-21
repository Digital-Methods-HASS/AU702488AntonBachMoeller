rooms<- c(1,5,2,1,3,1,NA,3,1,3,2,1,NA,1,8,3,1,4,NA,1,3,1,2,1,7,1,NA)
rooms2 <- c(rooms>2)

#Counts the instances of true in rooms2
sum(rooms2, na.rm=TRUE)

str(rooms)

median(rooms, na.rm = TRUE)

library(tidyverse)
read_csv("data/SAFI_clean.csv")
interviews <- read_csv("data/SAFI_clean.csv")
head(interviews)
interviews
