---
title: "Thoracic Surgery Binary Dataset - Week 8.1 Assignment"
author: "Andrea Fox"
date: "October 16th 2019"
---
  
install.packages("foreign")
library(foreign)
install.packages("caTools")
library(caTools)
install.packages("lattice")
library(lattice)
library(ggplot2)
install.packages("caret")
library(caret)
setwd("C:/Users/Andrea Fox/OneDrive/Documents/R/DSC520 Statistics Using R")
thoracic.data<-read.arff("ThoraricSurgery.arff")
summary(thoracic.data)
split <- sample.split(thoracic.data, SplitRatio = 0.8)
split
train <- subset(thoracic.data, split == "True")
test <- subset(thoracic.data, split == "False")
thoracic.data$Risk1Yr <- as.factor(thoracic.data$Risk1Yr)
thoracic.data$PRE9 <- as.factor(thoracic.data$PRE9)
thoracic.data$PRE14 <- as.factor(thoracic.data$PRE14)
thoracic.data$PRE17 <- as.factor(thoracic.data$PRE17)
thoracic.data$PRE30 <- as.factor(thoracic.data$PRE30)
mymodel <- glm(Risk1Yr ~ PRE9 + PRE14 + PRE17 + PRE30, data = thoracic.data, family = 'binomial')
summary(mymodel)
res <- predict(mymodel, type = "response")
res
confmatrix1 <- table(Actual_Value = thoracic.data$PRE9, Predict_value = res>0.5)
confmatrix1
confmatrix2 <- table(Actual_Value = thoracic.data$PRE14, Predict_value = res>0.5)
confmatrix2
confmatrix3 <- table(Actual_Value = thoracic.data$PRE17, Predict_value = res>0.5)
confmatrix3
confmatrix4 <- table(Actual_Value = thoracic.data$PRE30, Predict_value = res>0.5)
confmatrix4
(confmatrix1[[1,1]] +confmatrix1[[2,2]])/sum(confmatrix1)
(confmatrix2[[1,1]] +confmatrix2[[2,2]])/sum(confmatrix2)
(confmatrix3[[1,1]] +confmatrix3[[2,2]])/sum(confmatrix3)
(confmatrix4[[1,1]] +confmatrix4[[2,2]])/sum(confmatrix4)