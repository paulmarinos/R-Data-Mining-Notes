#Paul Marinos
#R Note 2: Linear Regression

#1:
Auto = read.csv("Auto.csv",header=T, na.strings="?") #load data
Auto=na.omit(Auto)                  #clean the data (omit "?")
lm.fit=lm(mpg~weight,data=Auto)     #simple linear regression
summary(lm.fit)                     #print summary of results

#2:
#there is a negative relationship between the predictor (weight) and the dependent variable (DV) (mpg).
#there is a very strong relationship
#the relationship between the predictor and the DV is negative
#The 95% confidence interval is (30.26539, 31.57829), and the 95% prediction interval is (22.37819, 39.46549)
predict(lm.fit, data.frame(weight=(c(2000))), interval = "confidence")
predict(lm.fit, data.frame(weight=(c(2000))), interval = "prediction")

#3:
plot(Auto$mpg, Auto$weight, main = 'Regression for Miles per Gallon on Weight',
     xlab = "MPG", ylab = 'Weight')                 #create plot
abline(lm(weight ~ mpg, data = Auto), col='red')    #display least squared regression line

#4:
par(mfrow=c(2,2))     #divide the plot area into 4 sections
plot(lm.fit)          #display 4 regression plots

#5:
College = read.csv("College.csv",header=T, na.strings="?")  #load the data
lm.fit2=lm(Grad.Rate~Private+Apps+Accept+Enroll+Top10perc+Top25perc+PhD+Terminal+S.F.Ratio+Expend,data=College) #linear regression
summary(lm.fit2)  #print summary of results

#6:
#PrivateYes, Apps, Enroll, Top10perc,  and Top25perc predictors seem to have statistically significant relationships to the dependent variable because they have p-values less than or equal to 0.05.

#7:
#The results imply that the PrivateYes and Apps variables have a strong positive relationship on Graduation Rate.
#In addition, the Enroll variable has a strong negative relationship with Graduation Rate, while students in the Top10perc and Top25perc have a strong positive relationships with Graduation Rate. 

#8:
#the interaction term is insignificant
summary(lm(Grad.Rate~Private*Top10perc, data=College))
summary(lm(Grad.Rate~Private+Top10perc+Private:Top10perc,data=College))


#9:
vif(lm.fit)

#10:
summary(lm.fit2)
lm.fit3=update(lm.fit2, ~.-Expend)
summary(lm.fit3)
lm.fit4=update(lm.fit3, ~.-S.F.Ratio)
summary(lm.fit4)
lm.fit5=update(lm.fit4, ~.-Terminal)
summary(lm.fit5)
lm.fit6=update(lm.fit5, ~.-Accept)
summary(lm.fit6)
lm.fit7=update(lm.fit6, ~.-Top10perc)
summary(lm.fit7)
