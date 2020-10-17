rm(list=ls())
data_storage <- 'C:/USERS/mbrae/OneDrive/Bureau/CEU/DA1/DA_team_project/data'
data_Pizza <- read.csv(paste0(data_storage,"/raw/data_Pizza.csv"))

## Data cleaning

data_Pizza = data_Pizza[-1,]
row.names(data_Pizza) <- df$id

str(data_Pizza)
data_Pizza$price_marg <- as.numeric(data_Pizza$price_marg)
data_Pizza$id <- as.numeric(data_Pizza$id)
data_Pizza$long <- as.numeric(data_Pizza$long)
data_Pizza$lat <- as.numeric(data_Pizza$lat)
data_Pizza$rating_google <- as.numeric(data_Pizza$rating_google)
data_Pizza$no_ratings <- as.numeric(data_Pizza$no_ratings)
data_Pizza$price_bev <- as.numeric(data_Pizza$price_bev)
data_Pizza$price_del <- as.numeric(data_Pizza$price_del)



## data Analysis
library(tidyverse)
library(moments)
summarise(data_Pizza,
          n= n(),
          mean = mean(x = price_marg),
          median = median(x = price_marg),
          min= min(price_marg),
          max = max(price_marg),
          sd = sd(price_marg),
          skew = skewness(price_marg))

summarise(data_Pizza,
          n= n(),
          mean = mean(x = price_bev),
          median = median(x = price_bev),
          min= min(price_bev),
          max = max(price_bev),
          sd = sd(price_bev),
          skew = skewness(price_bev))

