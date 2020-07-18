# Random Effects Models
print('Random Effects Models')

# load packages
library(tidyverse) # Modern data science library 
library(plm)       # Panel data analysis library
library(car)       # Companion to applied regression 
library(gplots)    # Various programing tools for plotting data
library(tseries)   # For timeseries analysis
library(lmtest)    # For hetoroskedasticity analysis

data_panel_101 <- read_csv('https://github.com/ds777/sample-datasets/blob/master/data_panel_101.csv?raw=true')
data_panel_101 <- pdata.frame(data_panel_101, index = c('country','year'))
# Display the tabulated and ordered data
print(data_panel_101) 
# Exploratory data analysis
coplot(y ~ year|country, type='b', data=data_panel_101) 
# The bars at the top indicate the position of the country from left to right 
# starting with the bottom row 
scatterplot(y~year|country, data=data_panel_101)
#  Heterogeneity between countries
plotmeans(y ~ country, data = data_panel_101)
# Heterogeneity through the years
plotmeans(y ~ year, data = data_panel_101)
# Panel Data Modeling (Random Effects Model)
# plm : Results variable
# x1: Prediction variable(s)
# index: c() => Panel settings
# model: Random effects option
random <-plm(y ~ x1, data = data_panel_101, index = c('country', 'year'), model = 'random')
#random <- plm(y ~ x1, data = data_panel_101, model="random")
# The interpretation of the coefficients is difficult,
# as they include both intra- and inter-entity.
# In the case of the TSCS, the data represent the average effect of X on Y when X 
# Changes over time and between countries in one unit.
summary(random)
# n =# of groups/panels, T = # years, N = total # of observations
