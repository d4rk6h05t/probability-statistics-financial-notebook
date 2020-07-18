#   Shapiro-Wilk normality test
print('Shapiro-Wilk normality test')
set.seed(10)
normal_distribution <- rnorm(100)
normal_distribution.test <- shapiro.test(normal_distribution)
print(normal_distribution.test)

#   Shapiro-Wilk normality test
#   data:  normal_distribution
#   W = 0.98908, p-value = 0.5911

uniform_distribution <- runif(100)
uniform_distribution.test <- shapiro.test(uniform_distribution)
print(uniform_distribution.test)

#   Shapiro-Wilk normality test
#   data:  uniform_distribution
#   W = 0.92848, p-value = 4.082e-05

plotn <- function(normal_distribution, main='Frequency Histogram \ny normal distribution', xlab='X', ylab='Density'){
    min <- min(normal_distribution)
    max <- max(normal_distribution)
    media <- mean(normal_distribution)
    dt <- sd(normal_distribution)
    hist(normal_distribution, freq = F, main = main, xlab = xlab, ylab = ylab)
    curve(dnorm(normal_distribution, media, dt), min, max, add = T, col='blue')
}

plotn(normal_distribution, main = 'Normal distribution')
plotn(uniform_distribution, main = 'Uniform distribution') 
