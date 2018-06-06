#Unit 2
B_train=read.table("svmdata2.txt",header = TRUE, sep="\t")
B_test=read.table("svmdata2test.txt",header = TRUE, sep="\t")
plot(X1 ~ X2, B_train, col = Colors) 
for (i in 1:200)
{
  svmModelLinear = svm(Colors ~ ., data = B_train, type = "C-classification", cost = i, kernel = "linear") 
  predictionsTrain = predict(svmModelLinear, B_train)
  print(i)
  print(table(B_train$"Colors", predictionsTrain))
}
area.pallete = function(n = 2) 
{ 
  cols = rainbow(n)
  cols[1:2] = c("PaleGreen", "Pink") 
  return(cols)
}
plot(X1 ~ X2, B_train, col = Colors) 
c = 1
svmModelLinear = svm(Colors ~ ., data = B_train, type = "C-classification", cost = c, kernel = "linear") 
plot(svmModelLinear, B_train, grid = 250, symbolPalette = symbols.pallete, color.palette = area.pallete) 
predictionsTrain = predict(svmModelLinear, B_train) 
table(B_tran$"Colors", predictionsTrain)
