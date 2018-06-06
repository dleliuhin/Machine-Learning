library(MASS)
library(datasets)
A<-longley
res <- lm(Employed ~., data = A)
summary(res)
A.1 <- A[,-5]
set.seed(12345)
n <- dim(A.1)[1]
A_rand <- A.1[ order(runif(n)), ]
A_train <- A_rand[1:(n/2),]
A_test <- A_rand[((n/2)+1):n,]
ml = c()
for (i in 1:25){
  ml <- c(ml, 10^(-3 + 0.2 * i))
}
res <- lm.ridge(Employed ~., data = A_train, lambda = ml)
plot(x=res$lambda, y=res$GCV, type="o")
lambda <- res$GCV[which.min(res$GCV)]
res <- lm.ridge(Employed ~., data = A_train, lambda = lambda)
print(res)
for(i in 1:25){
  res.test <- lm(Employed  ~., data = A_train)
  res.error <- (res.test$fitted.values - A_train$Employed) ^ 2
  res <- lm.ridge(Employed ~., data = A_train, lambda = ml[i])
  res.error <- res.error + ml[i] * sum(abs(res$coef))
  print(res.error)
}
