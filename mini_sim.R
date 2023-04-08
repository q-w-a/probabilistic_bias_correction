

cov <- matrix(c(1,.4,.4,1), nrow =2, byrow=TRUE)

X <- MASS::mvrnorm(n= 1e3, mu=c(0,0), Sigma = cov)

sd(X[,1] ) + sd(X[,2])
sd(X[,1] + X[,2])
sd(X[,1] ) + sd(X[,2]) >= sd(X[,1] + X[,2])



var(X[,1]) + var(X[,2])
var(X[,1] + X[,2])

var(X[,1]) + var(X[,2]) >= var(X[,1] + X[,2])
    