### HED 612 HW 7

# LOGISTICS
# install packages
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)


# check current working directory
getwd() 

#open ELS School dataset
els<- read_dta("data/els/els-stu-by-f2-select-vars.dta")


#Q2

    #explore variables
    attributes(els$bytxrstd)
    attributes(els$byhmwrk)

    #count missing
    els %>% filter(bytxrstd==-8) %>% count()   
    els %>% count(bytxrstd)

    #create dependent varible with true NA
    els <- els %>% 
      mutate(read_testscr  = ifelse(bytxrstd==-8, NA, bytxrstd))

    #check new dependent variable   
    summary(els$read_testscr, na.rm=TRUE)

#Q3
    # explore independent variable 
    els %>% filter(byhmwrk<0) %>% count()
    els %>% filter(is.na(byhmwrk)) %>% count()

    els %>% filter(byhmwrk>96) %>% count()

    #create new variable
    els <- els %>% 
      mutate(hw_hours = recode(as.integer(byhmwrk),
                               `-9` = NA_integer_,
                               `-8` = NA_integer_,
                               `-4` = NA_integer_,
                               `97`= 26L,
                               `98` = 21L,
                               `99` = 26L) )
    
    
    #check new var
    els %>% filter(byhmwrk>96)  %>% count(hw_hours)
    els %>% count(byhmwrk, hw_hours) %>% print(n=100)
    
#Q4
    
    #describe variables
    summary(els$read_testscr)
    summary(els$hw_hours)


#Q6
    mod1 <- lm(read_testscr ~ hw_hours, data=els)
    summary(mod1)

  confint(mod1, level = 0.95)

  
#Q7
  
  #explore f1sex variable
  attributes(els$f1sex)
  
  #check for missing
  els %>% count(is.na(f1sex))

  #create new var
  els <- els %>% 
    mutate(female= ifelse(f1sex==2, 1, 0))

  #check var
  els %>% count(female, f1sex)

  
#Q8
  
    els$female <- as.factor(els$female)
    mod2 <- lm(read_testscr ~ female, data=els)
    summary(mod2)