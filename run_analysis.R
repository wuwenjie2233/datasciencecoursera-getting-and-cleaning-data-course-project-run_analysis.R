library(reshape2)

dir <- "UCI HAR Dataset"

activity_labels <- read.table(file.path(dir, "activity_labels.txt"),
                              col.names = c("label", "name"),
                              colClasses = c("integer", "character"))

features <- read.table(file.path(dir, "features.txt"),
                       col.names = c("column", "name"),
                       colClasses = c("integer", "character"))

read_data_set <- function(name) {
        # read.table() maps the feature names to valid variable names.
        x <- read.table(file.path(dir, name, sprintf("X_%s.txt", name)),
                        col.names=features$name,
                        check.names=TRUE,
                        colClasses="numeric")
        y <- read.table(file.path(dir, name, sprintf("y_%s.txt", name)),
                        colClasses="numeric")
        s <- read.table(file.path(dir, name, sprintf("subject_%s.txt", name)),
                        colClasses="numeric")

        # Extract the measurements on the mean and standard deviation.
        measurements <- grep("mean|std", names(x), ignore.case=TRUE, value=TRUE)
        df <- x[, measurements]

        # Name the activities in the data set.
        df$activity <- factor(y[, 1], activity_labels[, 1], labels=activity_labels[, 2])

        df$subject <- s[, 1]

        df
}

train <- read_data_set("train")
test <- read_data_set("test")

# Combine both data sets.
data <- rbind(train, test)

dataMelt <- melt(data, id=c("activity", "subject"))
tidyData <- dcast(dataMelt, subject + activity ~ variable, mean)

write.table(tidyData, file="tidy.txt", row.names=FALSE, quote=FALSE)
