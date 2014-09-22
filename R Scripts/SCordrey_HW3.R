#Sean Cordrey
#HW 3

setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")
library("ggplot2")
library("hexbin")
vehicles<- read.table('vehicles.csv', header = T, sep=',',)

#categorical variables
#drive, eng_dscr, fueltype, fuelType1, fuelType 2, make, model, phevBlended, 
#trany, vClass, guzzler, trans_dscr, tCharger, sCharger, mpgData, atvType, 
#fuelType2, evMotor, mfrCode

#some field are missing values but are stated in the Data Manual for true meaning
#meaning can be transferred over.

#summaries of variables 26-50
summary(vehicles$highway08)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#9.00   20.00   23.00   23.74   27.00  111.00
summary(vehicles$highway08U)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.000   0.000   0.000   3.788   0.000 111.400 
summary(vehicles$highwayA08)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.0000   0.0000   0.0000   0.5963   0.0000 107.0000 
summary(vehicles$highwayA08U)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.0000   0.0000   0.0000   0.3092   0.0000 106.5000
summary(vehicles$highwayCD)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.000000 0.000000 0.000000 0.000235 0.000000 4.060000
summary(vehicles$highwayE)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.0000   0.0000   0.0000   0.1207   0.0000 120.0000 
summary(vehicles$highwayUF)
#Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#0.0000000 0.0000000 0.0000000 0.0003275 0.0000000 0.8130000
summary(vehicles$hlv)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.00    0.00    0.00    2.04    0.00   49.00
summary(vehicles$hpv)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.0     0.0     0.0    10.5     0.0   195.0
summary(vehicles$id)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#1    8853   17710   17790   26740   35710
summary(vehicles$lv2)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.000   0.000   0.000   1.875   0.000  41.000
summary(vehicles$lv4)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.000   0.000   0.000   6.217  13.000  55.000
summary(vehicles$pv2)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.00    0.00    0.00   13.75    0.00  194.00
summary(vehicles$pv4)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.00    0.00    0.00   13.75    0.00  194.00
summary(vehicles$range)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.0000   0.0000   0.0000   0.1705   0.0000 265.0000 
summary(vehicles$rangeCity)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.0000   0.0000   0.0000   0.1246   0.0000 262.7000        
summary(vehicles$rangeCityA)       
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.00000  0.00000  0.00000  0.01829  0.00000 77.50000              
summary(vehicles$rangeHwy)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.0000   0.0000   0.0000   0.1152   0.0000 266.8000        
summary(vehicles$UCity)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.00   18.00   21.00   22.17   25.00  197.60
summary(vehicles$UCityA)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
#0.0000   0.0000   0.0000   0.5393   0.0000 181.6000
summary(vehicles$UHighway)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.00   27.00   32.45   33.08   37.76  159.10
summary(vehicles$UHighwayA)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.000   0.000   0.000   0.803   0.000 152.200
summary(vehicles$year)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#1984    1990    1999    1999    2008    2015
summary(vehicles$youSaveSpend)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#-29500   -5000   -2500   -3071    -500    8750 

#Graphics
ggplot(vehicles) +
  geom_histogram(aes(x=youSaveSpend), binwidth = 1000) +
  theme_bw()


ggplot(vehicles, aes(x=year, y=comb08)) + 
  geom_point()+
  geom_smooth() +
  theme_bw()

ggplot(vehicles, aes(x=highway08U, y=co2TailpipeGpm)) +
  geom_point()+
  geom_smooth() +
  theme_bw()
