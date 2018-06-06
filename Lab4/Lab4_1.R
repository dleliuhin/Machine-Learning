library(cluster)
data("pluton")
for(i in seq(2, 16, by = 2))
{
  cl <- kmeans(pluton, 3, iter.max = i)
  png(filename = paste(toString(i),'claster.png'))
  plot(pluton, col = cl$cluster, main=paste('max=',toString(i)))
  points(cl$centers, col = 1:3, pch = 8, cex=2)
}
