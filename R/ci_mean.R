
library(tidyverse)
library(reshape2)

#x = mtcars [,c('mpg', 'disp')]
#ci_mean(mtcars)

# Standard Error functions #
# normal distribution
sterrNormal <- function(x) qnorm(0.975)* sd(x)/sqrt(length(x))
# student distribution
sterr <- function(x, n = length(x)) qt(0.975,df=n-1)* sd(x)/sqrt(length(x)) # t dist #

# ci_mean function #
ci_mean = function(x, normal = F){

  message('Must be a dataframe with at least two variables')

  mu = x %>% mutate(n = n()) %>% group_by(n) %>% summarise_each(funs(mean(., na.rm = T))) %>% melt(id.vars = 'n', value.name = 'mean')

  if(normal == T){
    err = x %>% group_by() %>% summarise_each(funs(sterrNormal)) %>% melt(value.name = 'error')
  }
  if(normal == F){
    err = x %>% group_by() %>% summarise_each(funs(sterr)) %>% melt(value.name = 'error')
  }

  meanerr = merge(mu, err, by = 'variable')
  meanerr = meanerr %>% mutate(low = mean - error, high = mean + error) %>% mutate(p = round(mean / sum(mean), 3)*100 ) # %>% mutate(hours = TimeClock(mean))
  return(meanerr)
}

