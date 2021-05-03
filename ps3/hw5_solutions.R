### HED 612 HW 5

# LOGISTICS
# install packages
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(ggplot2)


# Q1

  # check current working directory
  getwd() 
  
  #open CA School dataset
  caschool<- read_dta("data/ca/caschool-v2.dta")


#Q2

  #summary stats for dependent variable
  summary(caschool$avginc)
  
  #summary stats for independent variable
  summary(caschool$meal_pct)
  


#Q5

  #run regression 
  mod3<- lm(avginc ~ meal_pct, data=caschool)
  summary(mod3)

  #R2
  anova(mod3)

#Q8  
  
  #std dev
  sd(caschool$avginc)
