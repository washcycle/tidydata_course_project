library(plyr)

## Getting and Cleaning Data John Hopkins Coursera Course Project
# Data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Data must be unzipped into the current working directory

## 1 Merges the training and the test sets to create one data set.

# get the activity labels and store them in memory
activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              col.names =  c("activityID", "activity"),
                              stringsAsFactors = F)

features <- read.table("UCI HAR Dataset/features.txt", 
                              col.names =  c("featureID", "features"),
                              stringsAsFactors = F)

# Read the measurement data from files
test_set <-     read.table("UCI HAR Dataset//test/X_test.txt", col.names = features$features)
training_set <- read.table("UCI HAR Dataset//train/X_train.txt", col.names = features$features)

# Load subjects labels for training and test sets
training_subject_labels <- read.table("UCI HAR Dataset//train/subject_train.txt", 
                                col.names = c("subject"))
test_subject_labels <-     read.table("UCI HAR Dataset//test/subject_test.txt", 
                                col.names = c("subject"))

# Add subject variable to training and test data sets
test_set$subject <- test_subject_labels$subject
training_set$subject <- training_subject_labels$subject

## Add activities to data sets
test_set_activities <-     read.table("UCI HAR Dataset//test/y_test.txt", 
                                      col.names = c("activity"))
training_set_activities <- read.table("UCI HAR Dataset//train/y_train.txt", 
                                      col.names = c("activity"))

# Convert activity integer value to descriptive label
for( id in activities$activityID ){
    test_set_activities$activity[test_set_activities$activity == id] <- 
        activities$activity[activities$activityID == id]
    training_set_activities$activity[training_set_activities$activity == id] <- 
        activities$activity[activities$activityID == id]
}

# Add activity variable to training and test set
test_set$activity <- factor(test_set_activities$activity)
training_set$activity <- factor(training_set_activities$activity)

# merge the dataset
data_set <- merge(test_set, training_set, all = T)


## 2 Extracts only the measurements on the mean and standard deviation for each measurement. 

# Filter sets by only mean and standard deviation measurements
fdata_set <- (data_set[grep("mean|std|activity|subject",
                              names(training_set), 
                              ignore.case = T)])

fdata_set <- arrange(fdata_set, subject)

## 5 From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
tidydata <- aggregate(. ~ subject + activity, data = fdata_set, mean)
# appending Mean to the end of each column name
names(tidydata)[c(-1,-2)] <- sapply(names(tidydata)[c(-1,-2)], paste, 'Mean', sep=".")

# arrange by subject then by activity with respect to each subject
tidydata <- arrange(tidydata, subject, activity)
write.table(tidydata, "tidydata.txt", row.name=FALSE)
