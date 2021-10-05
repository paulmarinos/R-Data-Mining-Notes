# Chapter 2 Lab: Introduction to R

# 2.3.1 Basic Commands
# instructs R to join together the numbers 1, 3, 2, and 5, and to save them as a vector named x.
x <- c(1,3,2,5)
x
# We can also save things using = rather than <-
x=c(1,6,2)
x
y = c(1,4,3)
length(x)
length(y)
x+y
# look at  a list of all of the objects (e.g.data and functions that we have saved so far)
ls()
#delete any that we do not want
rm(x,y)
ls()
# remove all objects at once
rm(list=ls())

#matrix
?matrix
# By default, it creates matrix by successively filling in columns
x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
# We can also omit nrow and ncol
x=matrix(c(1,2,3,4),2,2)
x
#If we want to fill in the matrix by rows
matrix(c(1,2,3,4),2,2,byrow=TRUE)
#sqrt returns the square root of each element of a vector or a matrix
sqrt(x)
# raises each element of x to the power 2
x^2
#norm distribution: generates a vector of random normal variables, with the first argument n (the sample size)
x=rnorm(50)
#change the mean and sd
y=x+rnorm(50,mean=50,sd=.1)
#correlation between x and y
cor(x,y)

# produce the same set of random numbers so that the user can reproduce their results
set.seed(1303)
rnorm(50)
set.seed(3)
y=rnorm(100)
#mean () computes the mean of a vector of numbers
mean(y)
#variance
var(y)
#standard deviation
sqrt(var(y))
#standard deviation
sd(y)

# 2.3.2 Graphics

x=rnorm(100)
y=rnorm(100)
# plot(x,y) produces a scatterplot of the numbers in x versus the numbers in y. 
plot(x,y)
# label the plot
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")
#sava as a pdf file in working directory
pdf("Figure.pdf")
# dots become green
plot(x,y,col="green")

#Seq (a,b) can be used to create a sequence of numbers between a and b
x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)
y=x
#create the third dimension
f=outer(x,y,function(x,y)cos(y)/(1+x^2))
# make a contour plot to represent three-dimensional data
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)
#produce a color-coded plot whose colors depend on the z value.
image(x,y,fa)
# produce a three-dimensioanl plot
persp(x,y,fa)
# theta and phi control the angles at which the plot is viewed
persp(x,y,fa,theta=30)
#theta gives the azimuthal direction and phi the colatitude
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=70)
persp(x,y,fa,theta=30,phi=40)

# 2.3.3 Indexing Data
# suppose our data is stored in the matrix A
A=matrix(1:16,4,4)
A
# select the element corresponding to the second row and the third column
A[2,3]
# select the element corresponding to the first and third row & the second and the fourth column
A[c(1,3),c(2,4)]
A[1:3,2:4]
# no index for the column, indicates that should include all columns
A[1:2,]
# no index for the row, indicates that should include all rows
A[,1:2]
A[1,]
# negative sign means to keep all rows or columns except those indicated in the index
A[-c(1,3),]
A[-c(1,3),-c(1,3,4)]
# outputs the number of rows followed by the number of columns of a given matrix
dim(A)

# 2.3.4 Loading Data
# you should first put "Auto.data" in your working directory
# .data is a format refered to as data frame

Auto=read.table("Auto.data")
# fix: view the data. The data window must be closed before futher R commands can be entered
fix(Auto)
# header=T tells R that the first line of the file contains the variable names; na.strings tell R
# that any time it sees a particular character or set of characters (such as a question mark), it should be treated as a missing element of the data matrix.
Auto=read.table("Auto.data",header=T,na.strings="?")
fix(Auto)
Auto=read.csv("Auto.csv",header=T,na.strings="?")
fix(Auto)
# outputs the number of observations (rows) and the number of variables (columns)
dim(Auto)
# outputs the first four observations with all variables
Auto[1:4,]
#na.omit: removes the rows contain missing observations
Auto=na.omit(Auto)
# check the number of observations, we found that 5 observations are deleted
dim(Auto)
# check the variable names
names(Auto)

# 2.3.5. Additional Graphical and Numerical Summaries
# plot () function to produce scatterplots to see the relationships between two variables
plot(cylinders, mpg)
# we must type the dataset and the variable name joined with a $ symbol
plot(Auto$cylinders, Auto$mpg)
# or we use attach () in order to tell R to make the variables in the data frame available by names.
attach(Auto)
plot(cylinders, mpg)
#The cylinders variable is stored as a numeric vector, so R has treated it
#as quantitative. However, since there are only a small number of possible
#values for cylinders, one may prefer to treat it as a qualitative variable.
#converts quantitative variables into qualitative variables
cylinders=as.factor(cylinders)
plot(cylinders, mpg)
# a number of options can be specified to customize the plots
plot(cylinders, mpg, col="red")
#varwidth=T: the frequency of each value occurs
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T,horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
# create histogram
hist(mpg)
# col=2 has the same effect as col="red"
hist(mpg,col=2)

# pairs produce a scatterplot matrix for every pair of variables of any given dataset
pairs(Auto)
# just a subset of variables
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower,mpg)
summary(Auto)
summary(mpg)
