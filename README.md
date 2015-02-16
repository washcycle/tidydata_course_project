## Script Descriptions
**run_analysis.R**

Assumes that the data has been downloaded and unzipped into the working directory.

1. Loads the descriptive information first like subject and activity mapping. 
2. Then loads the test and training data. 
3. Once the data is loaded the script adds the proper labels and adds the subject and activitiy data. 
4. At this point there are two data frames that contain test and training data with subject and activity columns.
5. The test and training data frames are then merged.
6. The data is filtered down to only mean and standard deviation measurements.
7. Aggregate is used to get the mean for each filtered measurement with respect to all subjects and all activites for each subject resulting in a data frame of 180 total observations.


