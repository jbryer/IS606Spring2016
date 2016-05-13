library(ggplot2)

study <- data.frame(
	Hours=c(0.50,0.75,1.00,1.25,1.50,1.75,1.75,2.00,2.25,2.50,2.75,3.00,3.25,3.50,4.00,4.25,4.50,4.75,5.00,5.50),
	Pass=c(0,0,0,0,0,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1)
)

lr.out <- glm(Pass ~ Hours, data=study, family=binomial)

summary(lr.out)

study$fitted <- fitted(lr.out)

binomial_smooth <- function(...) {
	geom_smooth(method = "glm", method.args = list(family = "binomial"), ...)
}

ggplot(study, aes(x=Hours, y=Pass)) + geom_point() + 
	binomial_smooth(se=FALSE)

head(study)
study$residuals <- study$Pass - study$fitted

ggplot(study, aes(x=Hours, y=Pass)) + geom_point() + 
	binomial_smooth(se=FALSE) +
	geom_segment(aes(xend=Hours, yend=fitted), color='maroon')
