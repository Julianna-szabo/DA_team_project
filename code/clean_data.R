# Init
rm(list=ls())

### Install and import packages
#install.packages("geosphere")
library(tidyverse)
library(geosphere)

dp <- read_csv("data/raw/Data_Pizza.csv")
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