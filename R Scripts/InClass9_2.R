#Sean Cordrey
#In Class 9 Part 2

setwd("c:\\Users\\Sean\\Desktop\\Stat 3654")
load("fdata.Rdata")

final$gp <- runif(dim(final)[1])
testSet <- subset(final, final$gp <= 0.1)
trainSet <- subset(final, final$gp > 0.1)
rm(final)

install.packages("MASS")
library(MASS)

attach(trainSet)
#linear regression
fit<- lm(ssc ~ som1+som2+som3+som4+som5+som6+som7+som8+som9+som10+som11+som12+som13+som14
           +age+gender+location+ethnicity+coder)
summary(fit)
#step regression
step <- stepAIC(fit, direction = "both")
step
step$anova
#retained variables linear regression
fitRetained<-lm(ssc ~ som1+som2+som3+som4+som5+som9+som10+som12+som13+som14+
                  age+location+ethnicity+coder)
summary(fitRetained)

#Prediction
testSet$sscpred <- predict(fitRetained, newdata = testSet)
head(testSet)

library(ggplot2)
ggplot(data = testSet, aes(x = sscpred, y = ssc)) +
  geom_point(color = "red")+
  geom_line(aes(x = ssc, y = ssc), color = "blue")
