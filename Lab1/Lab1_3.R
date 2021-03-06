#���������� ���������� e1071, ���������� naiveBayes
library(e1071)
#��������� ������ ��� �������� �� csv-�����
train <- read.csv("Titanic_train.csv")
#��������� �������� ������ �� csv-�����
test <- read.csv("Titanic_test.csv")
#��������� �������� ������������� ����������� �������������� ���������� �� ������
BayesTitanic <- naiveBayes(as.factor(Survived)~., train)
#str(BayesTitanic)
# ���������� ���� �� ��������, ������� ������ fit �������������
# �� ������ �������� ������, ���� �� ��������, ������� ������
# ������������� ��� �����, �������� ������������� ������
BayesPrediction<-predict(BayesTitanic, test)
#str(BayesPrediction)
# ������� ���������� ���������� �� ������� �; 
# ����� �������������� ����������, ����������� �,
summary(BayesPrediction)
# ������� ������� ������
output<-data.frame(test$PassengerId, BayesPrediction)
#str(output)
# ���������� ���� ��������� � ���� ������� ��� ������� ������ �� ��������,
colnames(output)<-cbind("PassengerId","Survived")
# ���������� ���������� � csv-����
write.csv(output, file = 'Rushton_Solution.csv', row.names = F)
