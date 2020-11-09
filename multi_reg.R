df <- read.csv('edx_free_courses_cleaned.csv', header=TRUE, sep=",", fill=TRUE)
head(df)
unique(df)
typeof(df$enrollment)

# run multiple linear regression
y <- df$enrollment
x1 <- df$length_by_week
x2 <- df$difficulty
x3 <- df$certificate_price

fit <- lm(y ~ x1 + x2 + x3, data=df)
# show summary
summary(fit)
