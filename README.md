# DA1 Team Assignment
This repository contains our work to complete the team assignment for the ECBS5140 - Data Analysis 1 course at CEU.

# Goal
Our goal is to collect and analyze data on pizzerias located in Budapest. Our focus is on margherita pizza and 0.5l beverage prices and we want to investigate whether these prices are different for on-site (dine-in) and delivery consumption.

# Data
Our dataset consists of 40 observations. From these 40 observations 20 are for on-site consumption and 20 are for delivery.

Data was collected manually by visiting either the catering unit's website or searching for them on third-party food delivery services sites such as netpincer.hu or wolt.com/hu.

While looking for margherita pizza prices we sticked to the classic, basic options offered by catering units in order to maximize our chances of comparing observations that are for the same product.

As far as 0.5l beverages are considered, we opted for any 0.5l soda drink that was available at a particular catering unit. If such standardized 0.5l products as the Pepsi or the Coca-Cola coke were available we used their prices rather than lesser known drinks.

# Variables
| Variable | Description |
| --- | --- |
| id | Unique ID for identifying observations |
| category | Indicates whether the observation is for delivery or on-site (dine in) consumption  |
| name | Name of catering unit |
| website | URL to catering unit's website|
| address | Address of catering unit |
| long | Longitudinal coordinate of the location of catering unit |
| lat | Latitudinal coordinate of the lacation of catering unit |
| rating_google | Rating of catering unit on Google |
| no_ratings | Number of ratings given for catering unit on Google |
| open | Catering unit's usual time of opening |
| close | Catering unit's usual time of opening |
| no_pizza | Number of pizzas offered by catering unit |
| price_marg | Price of one margherita pizza at catering unit  |
| price_bev | Price of one 0.5l  beverage at catering unit  |
| price_del | Price of delivery to CEU campus (Budapest, Nádor u. 15, 1051) |
