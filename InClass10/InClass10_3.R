#Sean Cordrey
#In class 10 Part 3

setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")
library('shiny')
runApp('irisApp_3')
data(iris)
head(iris)
summary(iris)

names(iris)
features <- iris[,0:4]
scaled_features <- scale(features)
iris1 <- scaled_features
iris1 <- as.data.frame(iris1)
names(protein1)
label_points <- iris[,5]
label_points
