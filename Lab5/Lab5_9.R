library(datasets)
A <- cars
plot(A)
res<-lm(dist~speed, data = A)
plot(res$fitted.values)
new <-data.frame(speed=25:40)
dist <- c(predict(res,newdata = new))
new <- cbind(new, dist)
plot(new)
new2 <-data.frame(speed=40)
pred <- predict(res,newdata = new2)
print(pred)
