setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")

#importing the dataset
mydatacsv<- read.table('cars1.csv', sep=',', header=T)

dim(mydatacsv)
#dimensions are [50,2]

#assigning the [2,2] element to a new variable var1
var1<-mydatacsv[2,2]

#5) the variable names are speed and dist

#output of 1st column
mydatacsv[,1]
#output of 2nd column
mydatacsv[,2]

#assigning speeds to a new variable
SPEED<-mydatacsv[,1]

#output of 15th row
mydatacsv[15,]
