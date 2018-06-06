A <- read.table("cygage.txt", header = TRUE, sep = "\t")
f <- lm(calAge~Depth, data=A, weights = A$Weight)
summary(f)
