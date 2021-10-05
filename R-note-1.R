#Paul Marinos
#R Note 1: Introduction to Statistical Learning Methods

#Q1 - read the data into R
Auto = read.csv("Auto.csv",header=T, na.strings="?")
Auto=na.omit(Auto)


#Q2 - look at the data
View(Auto)

#Q3 - find out the number of rows and columns in this dataset
dim(Auto)

#Q4
#quantitative predictors: cylinders, displacement, horsepower, weight, acceleration, year
#qualitative predictors: origin, name

#Q5 - produce a numerical summary of variables in the dataset
summary(Auto)
#cylinder min = 3, max = 8
#displacement min = 68, max = 455
#horsepower min = ?, max = ?
#weight min = 1613, max = 5140
#acceleration min = 8, max = 24.80
#year min = 70, max = 82

#Q6 - Produce the mean and standard deviation for each numerical value
sapply(Auto[, 1:7], mean) #mean
sapply(Auto[, 1:7], sd) #s.d.

#Q7 - produce a scatterplot matrix of the first seven columns or variables of the data
pairs(Auto[,1:7])

#Q8 - produce some histograms for four variables (cylinders, displacement,horsepower and weight)
par(mfrow=c(2,2))
hist(Auto$cylinders) #create cylinders histogram
hist(Auto$displacement) #create displacement histogram
hist(Auto$horsepower) #create horsepower histogram
hist(Auto$weight) #create weight histogram

#Q9 - Which car has the highest mpg and which car has the lowest mpg?
attach(Auto)
Auto[which.max(mpg),] #find car with highest mpg
Auto[which.min(mpg),] #find car lowerst mpg

#Q10 - Create a new qualitative variable, called “FourCylinder”, by binning the cylinders variable
      
FourCylinders=rep("Yes",nrow(Auto))
FourCylinders[Auto$cylinders!=4]="No" #see how many cars have 4 cylinders
FourCylinders=as.factor(FourCylinders)
Auto=data.frame(Auto, FourCylinders)  #create data frame for FourCylinders
summary(Auto) #print summary




