#Sean Cordrey
#In class 3

setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")

load("exampleData.rData")
d<-merge(custdata, medianincome)
norm.income<-(d$income/d$Median.Income)
summary(norm.income)
#this normalized data makes it easier to see which values are "extreme" as in much
#higher or lower compared across different states

d$gp <- runif(dim(d)[1])
head(d$gp)

trainSet<-subset(d, d$gp <= 0.3)
testSet<-subset(d, d$gp > 0.7)
