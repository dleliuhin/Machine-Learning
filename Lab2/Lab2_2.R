## создаем фрейм
id <- seq(1,214)
RI <- runif(214, 0, 3)
Na <- runif(214, 0, 20)
Mg <- runif(214, 0, 3)
Al <- runif(214, 0, 3)
Si <- runif(214, 0, 100)
K <- runif(214, 0, 2)
Ca <- runif(214, 0, 20)
Ba <- runif(214, 0, 1)
Fr <- runif(214, 0, 2)
class <- factor(c(rep((1), 30), rep((2), 30), rep((3),30), rep((4),30), rep((5),30), rep((6),30), rep((7),34)))
glass = data.frame(id, RI, Na, Mg, Al, Si, K, Ca, Ba, Fr, class)
glass <- glass[,-1]

##построение графиков ошибок от K(ядра), анализ oшибок при варьировании distace
library(kknn)
glass.learn <- glass[1:200,]
glass.valid <- glass[-c(1:200),]
fit.kknn <- kknn(class ~ ., glass.learn, glass.valid)
fit.train1 <- train.kknn(class ~ ., glass.learn, kmax = 15, kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 1)
fit.train2 <- train.kknn(class ~ ., glass.learn, kmax = 15, kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 4)
#plot(fit.train1)
plot(fit.train2)

##запуск  knn с одним ядром, построение диограммы
m <- dim(glass)[1]
val <- sample(1:m, size = round(m/3), replace = FALSE,prob = rep(1/m, m))
glass.learn <- glass[-val,]
glass.valid <- glass[val,]
glass.kknn <- kknn(class~., glass.learn, glass.valid, distance = 1, kernel = "triangular")
summary(glass.kknn)
fit <- fitted(glass.kknn)
table(glass.valid$class, fit)
pcol <- as.character(as.numeric(glass.valid$class))
pairs(glass.valid[1:10], pch = pcol, col = c("green3", "red")
      [(glass.valid$class != fit)+1])

##получение класса по заданным признакам
RI <- c(1.51)
Na <- c(11.7)
Mg <- c(1.01)
Al <- c(1.19)
Si <- c(72.59)
K <- c(0.43)
Ca <- c(0.0)
Ba <- c(0.02)
Fr <- c(0.10)
class <- c(1)

example <- data.frame(RI, Na, Mg, Al, Si, K, Ca, Ba, Fr, class)

example.kknn <- kknn(class~., glass.learn, example, distance = 1, kernel = "triangular")
summary(example.kknn)
fit <- fitted(example.kknn)
table(example$class, fit)
pcol <- as.character(as.numeric(example$class))
pairs(glass.valid[1:10], pch = pcol, col = c("green3", "red")
      [(glass.valid$class != fit)+1])
