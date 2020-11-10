df <- read.csv('edx_free_courses_cleaned.csv', header=TRUE, sep=",", fill=FALSE)

counts <- sort(table(df$subject), decreasing = TRUE)

barplot(counts, main="Online courses by subject", ylab="number of courses",
        cex.names=0.5, las=2, space=1)
