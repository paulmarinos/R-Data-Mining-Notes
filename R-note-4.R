#Paul Marinos
#R Note 4: Tree-Based Methods

#1.1 - Create a training set containing a random sample of 800 observations, and a test set containing the remaining observations
library(ISLR)
data(OJ)
attach(OJ)
set.seed(2)
train = sample(1:nrow(OJ),800)
OJ.train = OJ[train,]
OJ.test = OJ[-train,]

#1.2 - Fit a tree to the training data, with Purchase as the response and the other variables as predictors. Use the summary( ) function to produce summary statistics about the tree.
library(tree)
tree.OJ = tree(Purchase~.,OJ.train)
summary(tree.OJ)

#1.3 - Plot the tree
plot(tree.OJ)
text(tree.OJ,pretty=0)

#1.4 - Predict the response on the test data, and produce a confusion matrix comparing the test labels to the predicted test labels.
pred.OJ = predict(tree.OJ,newdata=OJ.test,type = "class")
table(pred.OJ,OJ.test$Purchase)
mean(pred.OJ==OJ.test$Purchase)

#1.5 - Apply the cv.tree() function to the training set in order to determine the optimal tree size.
set.seed(7)
cv.OJ = cv.tree(tree.OJ,FUN=prune.misclass)
cv.OJ

#1.6 - Produce a plot with tree size (i.e. size) on the x-axis and cross-validated classification error rate (i.e. dev) on the y-axis.
plot(cv.OJ$size,cv.OJ$dev,type="b")

#1.7 - The tree size that corresponds to the lowest cross-validated classification error rate (i.e. dev) is size 4.

#1.8 - Produce a pruned tree corresponding to the optimal tree size obtained using cross-validation.
prune.OJ=prune.misclass(tree.OJ,best=4)
plot(prune.OJ)
text(prune.OJ,pretty=0)
tree.pred=predict(prune.OJ,OJ.test,type="class")
table(tree.pred,OJ.test$Purchase)
mean(tree.pred==OJ.test$Purchase)
mean(tree.pred!=OJ.test$Purchase)

#1.9 - If cross-validation does not lead to selection of a pruned tree (i.e. the accuracy rate produced in (1.8) is lower than the one in (1.4)), then create a pruned tree with five terminal nodes.
prune.OJ = prune.misclass(tree.OJ,best=5)
plot(prune.OJ)
text(prune.OJ,pretty=0)
tree.pred=predict(prune.OJ, OJ.test,type="class")
table(tree.pred,OJ.test$Purchase)
mean(tree.pred==OJ.test$Purchase)

#2.1 - Split the data set into a training set and a test set.
library(MASS)
set.seed(2)
attach(Carseats)
train=sample(1:nrow(Carseats),nrow(Carseats)/2)
test=Carseats[-train,"Sales"]

#2.2 - Fit a regression tree to the training set.
summary(tree.carseats)
plot(tree.carseats)
text(tree.carseats, pretty=0)
cv.carseats=cv.tree(tree.carseats)
cv.carseats
yhat=predict(tree.carseats, newdata = Carseats[-train])
mean((yhat-test)^2)

#2.3 - Use cross-validation in order to determine the optimal level of tree complexity.
# - a) Produce a plot with tree size on the x-axis and cross-validated classification error rate on the y-axis.
plot(cv.carseats$size, cv.carseats$dev,type="b")
# - b) What is the optimal level of tree complexity?
points(which.min(cv.carseats$dev),cv.carseats$dev[which.min(cv.carseats$dev)],col="red",pch=19,cex=1.25)
# - c) Using the optimal level of tree size to prune the tree, does pruning the tree improve the test MSE?
prune.carseats = prune.tree(tree.carseats,best = which.min(cv.carseats$dev))
plot(prune.carseats)
text(prune.carseats,pretty=0)
prune.pred = predict(prune.carseats, Carseats[-train,])
mean((prune.pred-test.y)^2)

#2.4 - use the bagging approach in order to analyze the data.
library(randomForest)
set.seed(1)
bag.carseats = randomForest(Sales~.,data=Carseats,mtry=10,subset=train,importance=T)
bag.carseats
yhat.bag = predict(bag.carseats,newdata=Carseats[-train,])
mean((yhat.bag - test.y)^2)

#2.5 - use random forrests to analyze the data.
set.seed(1)
rf.carseats = randomForest(Sales~.,data=Carseats,mtry=10/3,subset=train,importance=T)
yhat.rf = predict(rf.carseats,newdata=Carseats[-train,])
mean((yhat.rf-test.y)^2)
varImpPlot(rf.carseats)









