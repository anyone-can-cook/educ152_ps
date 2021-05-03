### HED 612 Homework 6

# LOGISTICS
# install packages
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)



# DIRECTORIES

# check current working directory
# this should result in something like the following: "/Users/karinasalazar/Dropbox/hed612"
# if it does not, did you open the R project first?
getwd() 


# OPEN & EXPLORE DATA

#using relative file path to open CA dataset 
caschool<- read_dta("data/ca/caschool-v2.dta")


#Q4
  mod1 <-  lm(testscr ~ computer, data=caschool)
  summary(mod1)

  
  