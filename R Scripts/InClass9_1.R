#Sean Cordrey
#In Class 9 part 1

setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")
load("fdata.Rdata")

head(final)
attach(final)
logit = glm(disorder ~ som1 + som2 + som3 + som4 + som5, data = final, family = "binomial")
summary(logit)
logit$coef
exp(logit$coef)

logit2 = glm(disorder ~ som6 + som7 + som8 + som9, data = final, family = "binomial")
summary(logit2)

logit3 = glm(disorder ~ som10 + som11 + som12 + som13 + som14, data = final, family = "binomial")
summary(logit3)
