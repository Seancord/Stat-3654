#Sean Cordrey
#InClass 8 Part 3
setwd('C:\\Users\\Sean\\Desktop\\Stat 3654')

load('fdata.rData')
attach(final)
model<-lm(ssc ~ som1 + som2 + som3 + som4 + som5 + som6 + som7 + som8 + som9
          + som10 + som11 + som12 + som13 + som14)
summary(model)
