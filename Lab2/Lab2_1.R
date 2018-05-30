##исследуем, как объЄм обучающей выборки и количество тестовых данных вли€ют на веро€тность ошибочной классификации 
library(kknn)
##—читываем данные из таблицы
A_raw <- read.table("Tic_tac_toe.txt", sep = ",", stringsAsFactors = TRUE)
## ”станавливаем размер объекта n.
n <- dim(A_raw)[1]
# ”станавливаем базу генерации случайных чисел
set.seed(12345)
##рандомизируем выборку
A_rand <- A_raw[ order(runif(n)), ]
for(i in seq(0.1, 0.9, by = 0.1))
{
  nt <- as.integer(n*i)
  A_train <- A_rand[1:nt, ]
  A_test <- A_rand[(nt+1):n, ]
  A_classifier <- train.kknn(V10 ~ ., A_train, kmax = 15,kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 1)
  A_predicted <- predict(A_classifier, A_test)
  t <- table(A_predicted, A_test$V10)
  print(t)  
}
