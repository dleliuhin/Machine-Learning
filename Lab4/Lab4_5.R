library(cluster)
A_raw <- read.table('seeds_dataset.txt', stringsAsFactors = TRUE)
cl <- kmeans(A_raw[,-8], 3, iter.max = 20)
plot(A_raw, col = cl$cluster)