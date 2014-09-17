#Sean Cordrey
#Stat 3654
#Sept 15, 2014
#HW 2

setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")
load("phsample.RData")
#This data contains information from the 2011 United States Census national PUMS American
#Community Servey. dhus contains 2982 observations with 210 variables. dpus contains 6279
#observations and 288 variables. Variables include things like sex, age, education, etc.

#psub is a subset of the main data dpus with some conditions. Workers self-describe as
#employed, workers report atleast 40 hours a week of activity, are between the ages 20
#and 50 and have an annual income between $1000 and $250000
psub=subset(dpus, with(dpus, (PINCP>1000)&(ESR==1)&(PINCP<=250000)&
                         +(PERNP>1000)&(PERNP<=250000)&(WKHP>=40)&(AGEP>=20)&
                       +(AGEP<=50)&(PWGTP1>0)&(COW %in% (1:7))&(SCHL %in% (1:24))))

#the following code clarifies the meaning of the data within the psub subset by
#assigning more clear names to what is meant by each variable by using a mapping. It also
#uses relevel to make distinctions between the different names so they can individually be
#used.
psub$SEX = as.factor(ifelse(psub$SEX==1, 'M', 'F'))
psub$SEX = relevel(psub$SEX, 'M')
cowmap <- c("Employee of a private for-profit",
            "Private not-for-profit employee",
            "Local government employee",
            "State government employee",
            "Federal government employee",
            "Self-employed not incorporated",
            "Self-employed incorporated")
psub$COW = as.factor(cowmap[psub$COW])
psub$COW = relevel(psub$COW,cowmap[1])
schlmap = c(rep("no high school diploma", 15),
            "Regular high school diploma",
            "GED or alternative credential",
            "some college credit, no degree",
            "some college credit, no degree",
            "Associate's degree",
            "Bachelor's degree",
            "Master's degree",
            "Professional degree",
            "Doctorate degree")
psub$SCHL = as.factor(schlmap[psub$SCHL])
psub$SCHL = relevel(psub$SCHL, schlmap[1])
dtrain = subset(psub,ORIGRANDGROUP >= 500)
dtet = subset(psub,ORIGRANDGROUP <500)

#With the data now put into a more meaningful format, we can begin to explore the data
#starting with the following simple summary
summary(dtrain$COW)

#project data
vehicles<- read.table('vehicles.csv', header = T, sep=',', quote = "\"", dec = ".",
                       fill = TRUE, comment.char = "")
names(vehicles)