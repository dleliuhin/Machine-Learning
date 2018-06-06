#Unit 3
C_test=read.table("svmdata3test.txt",header = TRUE, sep="\t")
area.pallete = function(n = 2) 
{ 
  cols = rainbow(n)
  cols[1:2] = c("PaleGreen", "Pink") 
  return(cols)
}
svmModelLinear = svm(Colors ~ ., data = C_test, type = "C-classification", cost = 1, kernel = "polynomial", degree = 20) 
plot(svmModelLinear, C_test, grid = 250, symbolPalette = symbols.pallete, color.palette = area.pallete)
predictionsTest = predict(svmModelLinear, C_test) 
table(C_test$"Color", predictionsTest)
