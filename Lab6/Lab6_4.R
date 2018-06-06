#Unit 4
D_test=read.table("svmdata4test.txt",header = TRUE, sep="\t")
area.pallete = function(n = 2) 
{ 
  cols = rainbow(n)
  cols[1:2] = c("PaleGreen", "Pink") 
  return(cols)
}
svmModelLinear = svm(Colors ~ ., data = D_test, type = "C-classification", cost = 1, kernel = "polynomial") 
plot(svmModelLinear, D_test, grid = 250, symbolPalette = symbols.pallete, color.palette = area.pallete)
predictionsTest = predict(svmModelLinear, D_test) 
table(D_test$"Color", predictionsTest)
