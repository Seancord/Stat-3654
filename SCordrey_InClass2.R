#InClass 2

getwd()
setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")

#The health insurance customer data
load('exampleData.rData')
#Examine data
names(custdata)
dim(custdata)
class(custdata)

#Summary statistics

summary(custdata) #for the entire data frame

#look at individual variables to spot problems

summary(custdata$is.employed)
summary(custdata$income)
summary(custdata$age)

#1)
#looking at custdata there are a few issues
#additonal information is needed to assess the negative value for income to determine if
#this is due to debt or an incorrect input. Is.Employed has a number of missing values so it needs
# to be determined if the customer data is missing or the values put in are meant to mean true or false
#housing type us also missing 56 values. It coincides with recent.move missing 56 values as well
#these may be the same individuals who there is missing data on. As well as num.vehicles missing 56
#values. There is an age of 146.7 which may need to be treated as an outlier. Lastly income has a number
# of missing values as well which need to be found or interpreted.

uciCar<-read.table('http://www.win-vector.com/dfiles/car.data.csv', header=T, sep=',')
summary(uciCar)

#2)
#none of the data in uciCar seems to be unlikely except maybe for the uniformity of every variable.
#otherwise nothing seems to be a glaring issue

d <- read.table(paste('http://archive.ics.uci.edu/ml/',
                      'machine-learning-databases/statlog/german/german.data',sep=''),
                stringsAsFactors=F,header=F)
names(d) <- c('Status.of.existing.checking.account',
              'Duration.in.month', 'Credit.history', 'Purpose',
              'Credit.amount', 'Savings account/bonds',
              'Present.employment.since','Installment.rate.in.percentage.of.disposable.income',
              'Personal.status.and.sex', 'Other.debtors/guarantors',
              'Present.residence.since', 'Property', 'Age.in.years',
              'Other.installment.plans', 'Housing',
              'Number.of.existing.credits.at.this.bank', 'Job',
              'Number.of.people.being.liable.to.provide.maintenance.for',
              'Telephone', 'foreign.worker', 'Good.Loan')

#check the resulting variable names in data frame d
names(d)

mapping <- list('A11'='... < 0 DM',
                'A12'='0 <= ... < 200 DM',
                'A13'='... >= 200 DM / salary assignments for at least 1 year',
                'A14'='no checking account',
                'A30'='no credits taken/all credits paid back duly',
                'A31'='all credits at this bank paid back duly',
                'A32'='existing credits paid back duly till now',
                'A33'='delay in paying off in the past',
                'A34'='critical account/other credits existing (not at this bank)',
                'A40'='car (new)',
                'A41'='car (used)',
                'A42'='furniture/equipment',
                'A43'='radio/television',
                'A44'='domestic appliances',
                'A45'='repairs',
                'A46'='education',
                'A47'='(vacation - does not exist?)',
                'A48'='retraining',
                'A49'='business',
                'A410'='others',
                'A61'='... < 100 DM',
                'A62'='100 <= ... < 500 DM',
                'A63'='500 <= ... < 1000 DM',
                'A64'='.. >= 1000 DM',
                'A65'='unknown/ no savings account',
                'A71'='unemployed',
                'A72'='... < 1 year',
                'A73'='1 <= ... < 4 years',
                'A74'='4 <= ... < 7 years',
                'A75'='.. >= 7 years',
                'A91'='male : divorced/separated',
                'A92'='female : divorced/separated/married',
                'A93'='male : single',
                'A94'='male : married/widowed',
                'A95'='female : single',
                'A101'='none',
                'A102'='co-applicant',
                'A103'='guarantor',
                'A121'='real estate',
                'A122'='if not A121 : building society savings agreement/life insurance',
                'A123'='if not A121/A122 : car or other, not in attribute 6',
                'A124'='unknown / no property',
                'A141'='bank',
                'A142'='stores',
                'A143'='none',
                'A151'='rent',
                'A152'='own',
                'A153'='for free',
                'A171'='unemployed/ unskilled - non-resident',
                'A172'='unskilled - resident',
                'A173'='skilled employee / official',
                'A174'='management/ self-employed/highly qualified employee/ officer',
                'A191'='none',
                'A192'='yes, registered under the customers name',
                'A201'='yes',
                'A202'='no')

nvariables <- dim(d)[2]


for(i in 1:nvariables) {
  if(class(d[,i])=='character') { 
    d[,i] <- as.factor(as.character(mapping[d[,i]])) 
  }
}

summary(d)

#3) For Personal.status.and.sex we're missing some information on single females. It would be a 
# good idea to separate married females from divorced and separated as well. All that can really be said
#about the given information is that there are more men applying for loans than women. Other.debtors/
#guarantors shows that most applying for loans are doing it alone. This could mean loaners are not
#strict in having multiple debtors or guarantors.

#Part 2

library(ggplot2)
install.packages("hexbin")
library(hexbin)
help(package=hexbin)

custdata2<-subset(custdata, (custdata$age > 0 & custdata$age < 100 & custdata$income > 0))

ggplot(custdata2, aes(x=age, y=income)) +
  geom_hex(binwidth=c(5, 10000)) +
  ylim(0, 200000) +
  geom_smooth(color = "white", se = F) +
  theme_bw() +
  ggtitle("Age vs Income")
  
ggplot(custdata2, aes(x=age, y=income)) +
  geom_point() +
  geom_smooth() +
  ylim(0, 200000) +
  ggtitle("Age vs Income")

#the scatterplot of Age vs Income has so many points that it is very noisy. The hexbin
#concentrates the data down into a graph that shows the information behind the data
#that the scatterplot would give, without the strain of the noise from the scatterplot

#Number of Vehicles and Income. Used a scatterplot. Not much information can be said
#about income's affect on the number of vehicles owned. The graph does show very few
#people regardless of income have more then 4 vehicles.
ggplot(custdata2, aes(x=num.vehicles, y=income)) +
  geom_point() +
  ylim(0,200000) +
  theme_bw() +
  ggtitle("Number of Vehicles vs Income")

#Income less than 30k and Recent Move. Because these are categorical variables, a stacked
#bar graph is used.The grey portion displays some missing data. Aside from that, most people
#have not recently moved whether or not the fall above or below an income of 30k.
ggplot(custdata2, aes(x=income.lt.30K, fill=recent.move)) +
  geom_bar() +
  theme_bw()
  