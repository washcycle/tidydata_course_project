# Getting and Cleaning Data Course Project 2015

## Data

source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

course provided zip file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Scripts
**run_analysis.R**

### Assumptions
Assumes that the data has been downloaded and unzipped into the working directory.

### Description
All project tasks are performed in this script.

1. Loads the descriptive information for subject and activity mapping. 
2. Then loads the test and training data. 
3. Once the data is loaded the script adds the proper labels and adds the subject and activitiy data. 
4. At this point there are two data frames that contain test and training data with subject and activity columns.
5. The test and training data frames are then merged.
6. The data is filtered down to only mean and standard deviation measurements.
7. Aggregate is used to get the mean for each filtered measurement with respect to all subjects and all activites for each subject resulting in a data frame of 180 total observations.
8. Saves the filtered tidy data set into tidydata.txt

For a detailed report look at the CodeBook.md file.
