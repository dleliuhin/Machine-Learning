library(mlbench)
library(adabag)
data(Glass)
l <- length(Glass[,1])
sub <- sample(1:l,l*(7/10))
mfinal <- 25
maxdepth <- 5
error <- c()
for(i in seq(1,201,by=10))
{
  Glass.bagging <- bagging(Type ~.,data=Glass[sub,], mfinal=i, maxdepth=5)
  Glass.bagging.pred <- predict.bagging(Glass.bagging, newdata=Glass[-sub, ])
  print(Glass.bagging.pred$error)
  error <- c(error,Glass.bagging.pred$error)
}
plot(error, x = seq(1, 201, 10))
