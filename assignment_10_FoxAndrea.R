---
title: "Section 2 - Week 10"
author: "Andrea Fox"
date: "October 28th 2019"
---
  
install.packages("devtools")
library(devtools)
library(ggplot2)
library(tidyverse)

setwd("C:/Users/Andrea Fox/OneDrive/Documents/R/DSC520 Statistics Using R")
kcpd.18 <- read.csv("KCPD_Crime_Data_2018.csv", header = TRUE)
#Check for null values
is.null(kcpd.18)
summary(kcpd.18)
head(kcpd.18)
kcpd.18clean <- kcpd.18$Beat <- kcpd.18$Address <- kcpd.18$City <- kcpd.18$Rep_Dist <- kcpd.18$DVFlag <- kcpd.18$Invl_No <- kcpd.18$Location<- NULL
head(kcpd.18)
write.csv(kcpd.18, file = "kcpd_clean_18.csv")
clean18 <- read.csv("kcpd_clean_18.csv", header = TRUE)
