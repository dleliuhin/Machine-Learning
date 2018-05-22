### Name: possumsites
### Title: Possum Sites
### Aliases: possumsites
### Keywords: datasets

### ** Examples

require(oz)
oz(sections=c(3:5, 11:16))
attach(possumsites)
points(latitude, longitude, pch=16, col=2)
chw <- par()$cxy[1]
chh <- par()$cxy[2]
posval <- c(2,4,2,2,4,2,2)
text(latitude+(3-posval)*chw/4, longitude, row.names(possumsites), pos=posval)



