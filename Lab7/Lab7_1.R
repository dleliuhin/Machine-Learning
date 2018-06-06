#Unit 1
library(rpart)
library(mlbench)
library(adabag)
data(Vehicle)
l <- length(Vehicle[,1])
sub <- sample(1:l,l*(7/10))
mfinal <- 11
maxdepth <- 5
error <- c()
for(i in seq(1,301,by=10))
{ 
  Vehicle.adaboost <- boosting(Class ~.,data=Vehicle[sub,], mfinal=i, maxdepth=maxdepth)
  Vehicle.adaboost.pred <- predict.boosting(Vehicle.adaboost, newdata=Vehicle[-sub, ])
  print(Vehicle.adaboost.pred$error)
  error <- c(error,Vehicle.adaboost.pred$error)
}
plot(error, x = seq(1, 301, 10))
