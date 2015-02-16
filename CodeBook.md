# Getting and Cleaning Data Course Project Feb 2015
This code book describes the variables, packages, and transformations performed in
the run_analysis.R script.

## Assumptions
1. The data in the intertia folders (raw data) is not used as the y_train.txt and x_test.txt files contain calulated data. This project only calulated measurements which are contained in the y_train.txt and x_test.txt files.

## Variables
* **activities** - activity ID to activity text label mapping, loaded from activity_labels.txt
* **features**  - descriptive column names for test and training data, loaded from features.txt
* **test_set** - test set data from X_test.txt, columns names set using features data
* **training_set** - training set data from X_train.txt, columns names set using features data
* **training_subject_labels** - subject ID to training_set observation mapping
* **test_subject_labels** - subject ID to test_set observation mapping
* **test_set_activities** - activity to test_set data set
* **training_set_activities** - activity to training_set data set
* **test_set** - test set data with subject and activity variables
* **training_set** - training set data with subject and activity variables
* **fdata_set** - filtered data set containing only mean and standard deviation measurements
* **tidydata** - final tidy data set with filtered data containing only the mean of the mean and standard deviation data for each subject and their respective activities. For this set a total of observations 180 observations from thirty subjects and six activites for each subject (3 * 6 = 180).

## Units
Gyro measurements are in units of radians/second.
The acceleration units (shortened to 'acc' in column names) are in standard gravity units 'g'.

## Transformations

### Subjects
The subject data for each data set is added as a new variable column, 'subject'. 

### Descriptive labels
The test_set_activities and training_set_activities data frames are looped through by the activityID in the activites data frame. If an activityID is found the numeric value is swapped with the correct descriptive label from the activites data frame.

Then the activity columns are converted into factors.

Last the test_set_activites and training_set_activities with descriptive labeling is added as a new variable column to their respective data sets.

### Merged data sets
merge function is used to merge the test_set and training_set into data_set data frame.

## Filtering
data_set is filtered by looking for columns names with only, 'mean' or 'std' in them, ignoring case. The filtered data is saved into the fdata_set data frame.

The filtered data set is then arranged by subject.


## Tidy Data Output
Aggregate function calulates the mean of each measurement with respect to the subject and activity.
To differentiate the columns '.Mean' is appended to the end of each measurement variable.

write.table is called to save the tidydata save the data to a file called tidydata.txt
