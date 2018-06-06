library(datasets)
A <- read.csv("UKgas.csv")
i = 1
print(A[i,3])
A.1 <- cbind(A[i,3], A[i+1,3], A[i+2,3], A[i+3, 3])
i = 5
while(i < 108){
  Tmp <- cbind(A[i,3], A[i+1,3], A[i+2,3], A[i+3, 3])
  A.1 <- rbind(A.1, Tmp)
  i <- i + 4
}
A.1 <- data.frame(A.1, Year=1960:1986)
res<-lm(X1+X2+X3+X4~Year, data = A.1)
res1<-lm(X1~Year, data = A.1)
res2<-lm(X2~Year, data = A.1)
res3<-lm(X3~Year, data = A.1)
res4<-lm(X4~Year, data = A.1)
plot(res$fitted.values, x = (1960:1986))
lines(res1$fitted.values, col = "yellow",  x = (1960:1986))
lines(res2$fitted.values, col = "blue",  x = (1960:1986))
lines(res3$fitted.values, col = "green", x = (1960:1986))
lines(res4$fitted.values, col = "red", x = (1960:1986))
new<- data.frame(Year = (2016))
pred <- predict(res1, newdata = new )
print(pred)
plot(pred, x = (1980:2016))
