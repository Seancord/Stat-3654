#Sean Cordrey
#In Class 10 part 1

setwd("C:\\Users\\Sean\\Desktop\\Stat 3654")

data(iris)
head(iris)
names(iris)
summary(iris)

features <- iris[,0:4]
scaled_features <- scale(features)
summary(scaled_features)

distance <- dist(scaled_features, method = "euclidean")
print(distance)

?hclust
hier_cl <- hclust(distance, method="ward.D")
plot(hier_cl, labels=iris$Species)

rect.hclust(hier_cl, k=3)
groups <- cutree(hier_cl, k = 3)
print(groups)

#The first cluster consist solely of setosa. The second cluster consist solely of virginica
#The 3rd and final cluster has some setosa and virginica but consist chiefly of versicolor.

*************************************************************************************************
#part 2
kmeans_clusters <- kmeans(distance, 3 , nstart=100, iter.max=100)
kmeans_clusters
kmeans_clusters$cluster

clusterDataframe <- data.frame(iris$Species, groups, kmeans_clusters$cluster)
names(clusterDataframe)[names(clusterDataframe)=="groups"]<-"Hierarchical"
names(clusterDataframe)[names(clusterDataframe)=="kmeans_clusters.cluster"]<-"Kmeans"

#Both algorithms give about the same results. The grouping are very similar with setosa and
#versicolor both having well defined groupings with virginica having a well defined grouping
#of virginicas but some spill over into the versicolor clustering.
