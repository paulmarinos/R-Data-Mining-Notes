#Paul Marinos
#R Note 5: Unsupervised Learning Methods

#1.1 - Generate a simulated data set with 30 observations in each of two classes (i.e. 60 observations in total), and 2 variables. 
set.seed(2)
x=matrix(rnorm(60*2), ncol=2)
x[1:30,1]=x[1:30,1]+3
x[1:30,2]=x[1:30,2]-4

#1.2
#Perform K-means clustering of the observations with K = 2
km.out=kmeans(x,2,nstart=20)
#Print results
km.out
km.out$tot.withinss
#Plot the data
plot(x, col=(km.out$cluster),main="K-Means Clustering Result With K=2", xlab = "", ylab = "", pch=20, cex=2)

#1.3
#Perform K-means clustering of the observations with K = 3
km.out=kmeans(x,3,nstart=20)
#Print results
km.out
km.out$tot.withinss
#Plot the data
plot(x, col=(km.out$cluster+1),main="K-Means Clustering Result With K=3", xlab = "", ylab = "", pch=20, cex=2)

#1.4
#Perform K-means clustering of the observations with K = 4
km.out=kmeans(x,4,nstart=20)
#Print results
km.out
km.out$tot.withinss
#Plot the data
plot(x, col=(km.out$cluster+1),main="K-Means Clustering Result With K=4", xlab = "", ylab = "", pch=20, cex=2)

#1.5 - Using the scale () function, perform K-means clustering with K = 2 on the data after scaling each variable to have standard deviation one.
km.out=kmeans(scale(x),2,nstart=20)
km.out
km.out$tot.withinss

#2.1 - Plot the hierarchical clustering dendrogram using complete linkage clustering with Euclidean distance as the dissimilarity measure. 
set.seed(2)
hc.complete=hclust(dist(USArrests), method="complete")
plot(hc.complete)

#2.2 - Cut the dendrogram at a height that results in three distinct clusters. 
cutree(hc.complete,3)

#2.3 - Hierarchically cluster the states using complete linkage and Euclidean distance, after scaling the variables to have standard deviation one.
sd.data=scale(USArrests)
hc.complete.sd=hclust(dist(sd.data), method="complete")
plot(hc.complete.sd)
cutree(hc.complete.sd,3)

#2.4 - After scaling the variables to have standard deviation one, plot the hierarchical clustering dendrogram using average linkage clustering with Euclidean distance as the dissimilarity measure
hc.average.sd=hclust(dist(sd.data),method="average")
plot(hc.average.sd)

#2.5 - After scaling the variables to have standard deviation one, plot the hierarchical clustering dendrogram using single linkage clustering with Euclidean distance as the dissimilarity measure. 
hc.single.sd=hclust(dist(sd.data),method="single")
plot(hc.single.sd)
