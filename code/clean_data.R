# Init
rm(list=ls())

### Install and import packages
#install.packages("geosphere")
library(tidyverse)
library(geosphere)
library(moments)
library(dplyr)

my_url <- "https://raw.githubusercontent.com/Julianna-szabo/DA_team_project/master/data/raw/dp.csv"
dp <- read_csv(my_url)

## Calculate distance from CEU campus
ceu = c(47.501348, 19.049375)
dp["dist_ceu"] = distm(data.matrix(dp[6:7]), ceu, fun = distHaversine)
distm(ceu, c(47.500386, 19.049434), fun=distHaversine)


## Calculate usual number of hours open
get_interval <- function(open,close){
  intv = close-open
  if (intv < 0) {
    intv = as.difftime("24:00:00")-open+close
  }
  intv=as.numeric(as.difftime(intv,units = "hours"))/60
  return(intv)
}

dp$open_mins=mapply(get_interval, dp$open, dp$close)


## Data Analysis
dp_summary_stats_pizza <- summarise(dp,
          n= n(),
          mean = mean(x = price_marg),
          median = median(x = price_marg),
          min= min(price_marg),
          max = max(price_marg),
          sd = sd(price_marg),
          skew = skewness(price_marg))
dp_summary_stats_bev <- summarise(dp,
          n= n(),
          mean = mean(x = price_bev),
          median = median(x = price_bev),
          min= min(price_bev),
          max = max(price_bev),
          sd = sd(price_bev),
          skew = skewness(price_bev))

## Data Visulization Part 1
dp %>% 
  ggplot(aes(x=price_marg))+
  geom_histogram(binwidth = 200, fill= "coral2", col= "black")+
  theme_bw()+
  labs(x = 'Price of Margarita Pizza', y= 'Number of Pizzas', title = "Distribution of Price for Pizza")

dp %>% 
  ggplot(aes(x=price_bev))+
  geom_histogram(binwidth = 50, fill= "light blue", col= "black")+
  theme_bw()+
  labs(x = 'Price of 0.5L beverage', y= 'Number of Pizzas', title = "Distribution of Price for Beverage")


## Data Visualization Part 2 - to be worked on
## Creating a factor variable
dp$category_f <- factor(dp$category)

ggplot(data = dp, aes(x = price_marg, fill = category_f))+
  geom_histogram(binwidth = 200, col = "black")+
  labs(x='Price of Margarita Pizza', y='Number of Pizzas', title = "Distribution of Price for On-site", fill= 'category')+
  facet_wrap(~category_f)

#T -test

# Hypothesis
# Null mean(on-site)=mean(delivery)
# Alternative mean(on-site) not = mean(delivery)

price_offline <- dp$price_marg[dp$category=="On-site"]
price_online <- dp$price_marg[dp$category=="Delivery"]

t.test(price_offline,price_online, alternative = "two.sided")