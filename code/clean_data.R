# Init
rm(list=ls())

### Install and import packages
#install.packages("geosphere")
library(tidyverse)
library(geosphere)
library(moments)

dp <- read_csv("data/raw/dp.csv")
ceu = c(47.501348, 19.049375)
dp["dist_ceu"] = distm(data.matrix(dp[6:7]), ceu, fun = distHaversine)
distm(ceu, c(47.500386, 19.049434), fun=distHaversine)

dp["open_hours"] = get_hours(dp$open,dp$close)

get_interval <- function(open,close){
  intv = close-open
  if (intv < 0) {
    intv = as.difftime("24:00:00")-open+close
  }
  intv=as.numeric(as.difftime(intv,units = "hours"))/60
  print(intv)
  return(intv)
}

dp$open_mins=mapply(get_interval, dp$open, dp$close)


## data Analysis
summarise(dp,
          n= n(),
          mean = mean(x = price_marg),
          median = median(x = price_marg),
          min= min(price_marg),
          max = max(price_marg),
          sd = sd(price_marg),
          skew = skewness(price_marg))

summarise(dp,
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
dp %>%
  filter(category == "On-site") %>% 
  ggplot(aes(x=price_marg))+
  geom_histogram(binwidth = 200, fill= "peachpuff2", col= "black")+
  theme_bw()+
  labs(x = 'Price of Margarita Pizza', y= 'Number of Pizzas', title = "Distribution of Price for On-site")

dp %>%
  filter(category == "Delivery") %>% 
  ggplot(aes(x=price_marg))+
  geom_histogram(binwidth = 200, fill= "plum2", col= "black")+
  theme_bw()+
  labs(x = 'Price of Margarita Pizza', y= 'Number of Pizzas', title = "Distribution of Price for Delivery")

#T -test

# Hypothesis
# Null mean(on-site)=mean(delivery)
# Alternative mean(on-site) not = mean(delivery)

t.test(price_marg,
       alternative = "two.sided", mu = 0, var.equal = TRUE, 
)

