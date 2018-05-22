### Name: cv.binary
### Title: Cross-Validation for Regression with a Binary Response
### Aliases: cv.binary
### Keywords: models

### ** Examples

frogs.glm <- glm(pres.abs ~ log(distance) + log(NoOfPools), 
   family=binomial,data=frogs)
cv.binary(frogs.glm)

mifem.glm <- glm(outcome ~ ., family=binomial, data=mifem)
cv.binary(mifem.glm)



