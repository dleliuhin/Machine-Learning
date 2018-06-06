A <- read.table("reglab2.txt", header = TRUE, sep = "\t")
combination <- combn(A[, 2:5], 2)
for(i in 1:length(combination[1,]))
{
  tmp <- data.frame(A$y, combination[1, i], combination[2, i])
  res <- lm(tmp$A.y ~., data = tmp)
  print(sum((tmp$A.y - res$fitted.values)^2))
}
