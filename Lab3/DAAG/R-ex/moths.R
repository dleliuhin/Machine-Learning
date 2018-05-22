### Name: moths
### Title: Moths Data
### Aliases: moths
### Keywords: datasets

### ** Examples

print("Quasi Poisson Regression - Example 8.3")
rbind(table(moths[,4]), sapply(split(moths[,-4], moths$habitat), apply,2, 
sum))
A.glm <- glm(formula = A ~ log(meters) + factor(habitat), family = 
quasipoisson, data = moths)
summary(A.glm)
moths$habitat <- relevel(moths$habitat, ref="Lowerside")
A.glm <- glm(A ~ habitat + log(meters), family=quasipoisson, data=moths)
summary(A.glm)$coef



