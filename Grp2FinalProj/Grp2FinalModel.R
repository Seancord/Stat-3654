

setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")
vehicles<- read.table('SmallVehicleData.csv', header = T, sep=',',)
vehicles <- vehicles[vehicles$fuelType != "Electricity",]

vehicles$gp <- runif(dim(vehicles)[1])
testSet <- subset(vehicles, vehicles$gp <= 0.1)
trainSet <- subset(vehicles, vehicles$gp > 0.1)

attach(trainSet)
fit <- lm(city08 ~ make + fuelType + cylinders + drive + trany + VClass)
summary(fit)

?predict
testSet$mpgpred <- predict(fit, newdata = testSet)
head(testSet)

library(ggplot2)
ggplot(data = testSet, aes(x = mpgpred, y = city08)) +
  geom_point(color = "red")+
  geom_line(aes(x = city08, y = city08), color = "blue")
