#Sean Cordrey
#In Class 1
setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")

#part 1
data(mtcars)
head(mtcars)
names(mtcars)
?mtcars

#Data Manual
# mpg Miles/(US) gallon
# cyl Number of Cylinders
# disp Displacement (cu in.)
# hp Gross Horsepower
# drat Rear axle ratio
# wt Weight (lb/100)
# qsec 1/4 mile time
# vs V/S
# am Transmission (0=automatic, 1=manual)
# gear Number of forward gears
# carb Number of Carburetors

install.packages('rpart')
library(rpart)

mtcars$gp <- runif(dim(mtcars)[1])
dTrain <- subset(mtcars, mtcars$gp > .25)
dTest <- subset(mtcars, mtcars$gp <= .25)

head(dTrain)
names(dTrain)
head(dTrain$am)

dTrain$response <- dTrain$am > 0
head(dTrain$response)
catVars<-data.frame(mtcars$cyl, mtcars$vs, mtcars$gear, mtcars$carb)
numericVars<-data.frame(mtcars$mpg, mtcars$disp, mtcars$hp, mtcars$drat, mtcars$wt,
                        mtcars$qsec)  
predVar1=mtcars$mpg
predVar2=mtcars$cyl

selVars<-paste('pred ',c(catVars, numericVars), sep='')
f <- paste('response ~ ',paste(selVars,collapse=' + '),sep='')
f
tmodel <- rpart(f,data=dTrain,
                control=rpart.control(cp=0.001,minsplit=1000,
                                      minbucket=1000,maxdepth=5))
#No matter how I input the features into determining mtcars$am, the tmodel will not go through
#How selVars is constructed is not explained in the example it is simply given. I have not
#found a way to get this function to work no mater what I try. I keep getting a variable
#lengths differ error. And all the following test are dependent upon having the Tmodel to
#determine the AUC so I'm not sure what I can do in this situation.
tmodel

install.packages("rpart.plot")
library(rpart.plot)
prp(tmodel)

install.packages('ROCR') 
library(ROCR)

dTrain$pred <- predict(tmodel, newdata = dTrain)
head(dTrain$pred)
eval <- prediction(dTrain$pred, dTrain$response)

auc_calc <- performance(eval,'auc')
auc_calc@y.values
#AUC of 0.69
plot(performance(eval, "tpr", "fpr"))
#part 2
knnTrain <- dTrain
names(knnTrain)

response <- dTrain$am > 0
head(response)
head(knnTrain)
dim(knnTrain)

install.packages('class')
library(class)

system.time(knnDecision <- knn(knnTrain,knnTrain,response,k=200,prob=T))
head(knnDecision)
knnPred <- ifelse(knnDecision==TRUE,
                  attributes(knnDecision)$prob,
                  1-(attributes(knnDecision)$prob))
head(knnPred)

library(ROCR)
eval <- prediction(knnPred, response)
auc_calc <- performance(eval,'auc')
auc_calc@y.values
#AUC of 0.5
#################Logistic algo

f <- paste('response ~ ',paste(selVars,collapse=' + '),sep='') 
system.time(gmodel <- glm(as.formula(f),
                          data=knnTrain,
                          family=binomial(link='logit')))
log_predict <- predict(gmodel, 
                       newdata=knnTrain, 
                       type = "response") #get p predictions

#get AUC for logistic model

eval <- prediction(log_predict, response) #from ROCR package
auc_calc <- performance(eval,'auc')
auc_calc@y.values 
#AUC of 0.73
###########CART algo
#train CART decision tree, get AUC and system time
library(rpart)
f <- paste('response ~ ',paste(selVars,collapse=' + '),sep='')
system.time(tmodel <- rpart(f,data=dTrain,
                            control=rpart.control(cp=0.001,minsplit=1000,
                                                  minbucket=1000,maxdepth=5)))

dTrain$pred <- predict(tmodel, newdata = dTrain)
dTrain$response <- dTrain$churn > 0

#calculate AUC for CART decision tree
eval <- prediction(dTrain$pred, dTrain$response) 
auc_calc <- performance(eval,'auc')
auc_calc@y.values
#AUC of 0.71
#The logistic model does the best.
#part3
install.packages("e1071")
library(e1071)
system.time(fit <- naiveBayes(as.formula(f), data=dTrain))


system.time(naivB_pred <- predict(fit, dTrain, type = 'raw'))
head(naivB_pred) #need just the "probability of TRUE" as prediction

eval <- prediction(naivB_pred[,2], dTrain$response) 
auc_calc <- performance(eval,'auc')
auc_calc@y.values
#AUC of .69
#The K nearest neighbor logistics method does the best with an AUC of .73