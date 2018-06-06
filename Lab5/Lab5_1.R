A <- read.table("reglab1.txt", header = TRUE, sep = "\t")
data <- lm(z ~ ., data = A)
summary(data)
