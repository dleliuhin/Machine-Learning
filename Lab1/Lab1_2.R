library(e1071)
x1_1 <- rnorm(50, mean = 10, sd = 4)
x1_2 <- rnorm(50, mean = 20, sd = 3)
x2_1 <- rnorm(50, mean = 14, sd = 4)
x2_2 <- rnorm(50, mean = 18, sd = 4)
# строим график
plot(x1_1, x2_1, pch=21, xlim=c(0, 30),ylim=c(0, 30))
# выводим координаты точек 
points(x1_2,x2_2, pch=22)
# соединяем выборки
x1 <- c(x1_1, x1_2)
x2 <- c(x2_1, x2_2)

class<-c(rep('-1',50),rep('1',50))

t<-data.frame(x1, x2, class, stringsAsFactors = TRUE)
for (i in seq(20,80,by=10)) 
{
  idx<-sample(1:dim(t)[1],20)
  train<-t[-idx, ]
  test<-t[idx, ]
  model<-naiveBayes(train[,-3],train$class)
  t_predicted<-predict(model, test)
  print(table(t_predicted,test$class))
}