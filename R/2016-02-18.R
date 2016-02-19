m <- 70
s <- 3.29

test <- c(65, 70, 75)
z <- (test - m) / s

plot(cbind(z, test))

test <- seq(60, 80, 0.1)
z <- (test - m) / s

plot(cbind(z, test))

# y = mx + b
# (mean, 0)
# (73.29, 1)
