set.seed(2112)
library(MASS)
library(ggplot2)

sigma <- matrix(c(10, 3, 3, 2), 2, 2)
thedata <- mvrnorm(n = 20, mu = c(1, 2), Sigma=sigma)
thedata <- as.data.frame(thedata)
names(thedata) <- c('x','y')

ggplot(thedata, aes(x=x, y=y)) +
	geom_vline(xintercept=mean(thedata$x), color='maroon') +
	geom_hline(yintercept=mean(thedata$y), color='maroon') + 
	geom_point() + 
	geom_smooth(method='lm', level=2)

cor(thedata$x, thedata$y)
lm(y ~ x, thedata)

# Add an outlier at the mean of x
thedata2 <- rbind(thedata, c(
	'x'=mean(thedata$x), 
	'y'=(max(thedata$y) * 2)
))

ggplot(thedata2, aes(x=x, y=y)) +
	geom_vline(xintercept=mean(thedata2$x), color='maroon') +
	geom_hline(yintercept=mean(thedata2$y), color='maroon') + 
	geom_point() + 
	geom_smooth(method='lm', level=0) +
	geom_smooth(method='lm', data=thedata, linetype=2, level=0) # The original regression line

cor(thedata2$x, thedata2$y)
lm(y ~ x, thedata2)
