#Sept 8, 2014
#Sean Cordrey
#Stat 3654
#HW 1

setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")
?help
?read.table

#1)
prices.csv<-read.table('prices.csv', header = FALSE, sep=',', skip = 1)
colnames(prices.csv)<-c('PRICE', 'SQFT', 'AGE', 'NE') 

prices.csv2<-read.table('prices.csv', header=TRUE, sep=',') # to check if identical

#row.names is used to assign vectors of row names to rows

#importing HW1data
HW1data.txt<-read.table('HW1data.txt', header = TRUE, sep="")

#2)
?cbind
#matrix of the first 4 rows and columns of prices.csv
mat1<-cbind(prices.csv[1:4,1],prices.csv[1:4,2],prices.csv[1:4,3],
           +prices.csv[1:4,4])
mat1[4,4] #printing the last element of the 4x4
t(mat1) #transposing mat1
solve(mat1) #the inverse of mat1

#3)
fpe<-read.table("http://data.princeton.edu/wws509/datasets/effort.dat")
fpe[fpe$effort == 0,] #printing observations with effort = 0
names(fpe) #getting the variable names
row.names(fpe) #names of the rows
head(fpe) #prints the first 6 observations
write.csv(fpe, file="fpe.csv") #exporting data as csv
write.table(fpe, file="fpe.txt", sep="\t") #exporting data as txt
