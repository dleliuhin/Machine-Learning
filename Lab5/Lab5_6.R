library(datasets)
A <- JohnsonJohnson
plot(A)
i = 1
A.1 <- cbind(A[i], A[i+1], A[i+2], A[i+3])
i = 5
while(i < 84){
  myTmp <- cbind(A[i], A[i+1], A[i+2], A[i+3])
  A.1 <- rbind(A.1, myTmp)
  i <- i + 4
}
A.1 <- data.frame(A.1, 1960:1980)
res<-lm(X1+X2+X3+X4~X1960.1980, data = A.1)
res1 <- lm(X1~X1960.1980, data = A.1)
res2<-lm(X2~X1960.1980, data = A.1)
res3<-lm(X3~X1960.1980, data = A.1)
res4<-lm(X4~X1960.1980, data = A.1)
plot(res$fitted.values, x = (1960:1980))
lines(res1$fitted.values, col = "black",  x = (1960:1980))
lines(res2$fitted.values, col = "blue",  x = (1960:1980))
lines(res3$fitted.values, col = "green", x = (1960:1980))
lines(res4$fitted.values, col = "red", x = (1960:1980))

new<- data.frame(X1960.1980 = (2016))
pred <- predict(res2, newdata = new )
print(pred)
