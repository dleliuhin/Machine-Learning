#подключаем библиотеку e1071, содержащую naiveBayes
library(e1071)
#Считываем данные для обучения из csv-файла
train <- read.csv("Titanic_train.csv")
#Считываем тестовые данные из csv-файла
test <- read.csv("Titanic_test.csv")
#Вычисляем условные апостериорные вероятности категориальных переменных по Байесу
BayesTitanic <- naiveBayes(as.factor(Survived)~., train)
#str(BayesTitanic)
# возвращает либо те значения, которые модель fit предсказывает
# на основе исходных данных, либо те значения, которые модель
# предсказывает для новых, заданных пользователем данных
BayesPrediction<-predict(BayesTitanic, test)
#str(BayesPrediction)
# выводит обобщенную информацию об объекте а; 
# набор статистических параметров, описывающих а,
summary(BayesPrediction)
# создаем таблицу данных
output<-data.frame(test$PassengerId, BayesPrediction)
#str(output)
# объединяет свои аргументы в одну матрицу или таблицу данных по столбцам,
colnames(output)<-cbind("PassengerId","Survived")
# записываем результаты в csv-файл
write.csv(output, file = 'Rushton_Solution.csv', row.names = F)