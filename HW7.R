### hw 7
#load data
dat <- read.csv("https://raw.githubusercontent.com/colby-es218-2021/hw07-rghust21/main/SP2021.csv?token=AS457W2G7MSTBYAVGK65GNTAHFJU2")

#load librarys
library(lubridate)
library(dplyr)
library(forcats)
library(stringr)


#using casewhen
dat1 <- dat %>%
  mutate(Overenrolled <- case_when(Reg > Max ~ "0",
                                   Reg == Max ~ "C",
                                   Reg < Max ~ "U",
                                   is.na(Reg) | is.na(Max) ~ NA_character_),
         stime =  str_split_fixed(Times, "-", 2 ) [ ,1],
         etime =  str_split_fixed(Times, "-", 2 ) [ ,2])

