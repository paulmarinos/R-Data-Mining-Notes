#Paul Marinos
#R Note 3 - Logistic Regression and KNN

#Q3 Part a)
require(ISLR)     #load the ISLR package
library(ISLR)
summary(Weekly)   #produce some numerical summaries of the Weekly data

#Q3 Part b)
pairs(Weekly)     #produce a scatterplot matrix of the variables of the data

#Q3 Part c)
Year=Weekly[,1:1]   #year column
Volume=Weekly[,7:7] #volume column
cor(Year,Volume)    #pairwise correlation volume
#The pairwise correlation value between Year and Volume is 0.84

#Q3 Part d)
#The relationship between Year and Volume is positive

#Q4 - perform logistic regression
glm.fits=glm(Direction~Lag1+Lag2+Lag3+Lag4+Volume,data=Weekly,family=binomial)
summary(glm.fits)
# The Lag2 predictor seems to be statistically significant as it has a p-value <= 0.1.

#Q5
attach(Weekly)                                #attach column names
glm.probs=predict(glm.fits,type="response")   #predict the prob that the market will go up
glm.pred=rep("Down", 1089)                    #create vector based on if predicted market increase is greater than or less than 0.5
glm.pred[glm.probs>.5]="Up"
cm = table(glm.pred,Direction)                #create confusion matrix
560/(560+429)                                 #precision rate
560/(560+45)                                  #recall rate
#the precision rate is 0.5662285
#the recall rate is 0.9256198

#Q6 - Fit logistic regression model with training data period from 1990-2009 with Lag2 as only predictor
train=(Year<2010)
weekly.2010=Weekly[!train,]
dim(weekly.2010)                      #view number of data objects
Direction.2010=Direction[!train]
glm.fits2=glm(Direction~Lag2,data=Weekly,family=binomial, subset=train)
glm.probs2=predict(glm.fits2,weekly.2010,type="response")
glm.pred2=rep("Down",52)
glm.pred2[glm.probs2>.5]="Up"
cm2=table(glm.pred2,Direction.2010)   #create confusion matrix
cm2
mean(glm.pred2==Direction.2010)
#0.6730769 is the overall fraction of correct predictions for the held out data (test data)

#Q7 - Repeat Q6 using KNN with K=1
library(class)
train.x=Lag2[train]
test.x=Lag2[!train]
train.Direction=Direction[train]
set.seed(1)
knn.pred=knn(data.frame(train.x), data.frame(test.x), train.Direction)
cm3=table(knn.pred,Direction.2010)  #create confusion matrix
cm3
mean(knn.pred==Direction.2010)  #overall fraction of correct predictions for held out data
#0.4807692 is the overall fraction of correct predictions for held out data

#Q8 - Repeat Q6 using KNN with K=10
knn.pred=knn(data.frame(train.x), data.frame(test.x), train.Direction, k=10)
cm3=table(knn.pred,Direction.2010)
cm3
mean(knn.pred==Direction.2010)
#0.6153846 is the overall fraction of correct predictions for held out data

