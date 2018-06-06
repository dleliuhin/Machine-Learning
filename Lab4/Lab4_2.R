library(cluster)
cl1 <- c()
cl2 <- c()
for(i in seq(1,50, by=2))
{
  cl1 <- c(cl1,runif(1, min=10, max=11.5))
  cl1 <- c(cl1,runif(1, min=18, max=18.5))
  cl1 <- c(cl1,runif(1, min=25, max=26))
  cl2 <- c(cl2, i)  
}
fr<-data.frame(cl2,cl1)

res_man_true<-clara(fr, 3, metric = "manhattan", stand = TRUE)
png(file = 'cl_man_true.jpg')
plot(fr, col = res_man_true$clustering)

res_eucl_true<-clara(fr, 3, metric = "euclidean", stand = TRUE)
png(file = 'cl_eucl_true.jpg')
plot(fr, col = res_eucl_true$clustering)

res_man_false<-clara(fr, 3,metric = "manhattan", stand = FALSE)
png(file = 'cl_man_false.jpg')
plot(fr, col = res_man_false$clustering)

res_eucl_false<-clara(fr, 3, metric = "euclidean", stand = FALSE)
png(file = 'cl_eucl_false.jpg')
plot(fr, col = res_eucl_false$clustering)