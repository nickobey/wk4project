# wk4project - Getting and Cleaning Data
R version 4.1.3 (2022-03-10) -- "One Push-UP"

## Original Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Link to the original data:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Files used from original data:
- activity_labels.txt
- features.txt
- subject_test.txt
- X_test.txt
- y_test.txt
- subject_train.txt
- X_train.txt
- y_train.txt

## run_analysis.R script
*Note: uses the dplyr (v1.0.8) package from Tidyverse*

1. Downloads and unzips data from the above link
2. Reads txt files : into data frames
    -  subject files : testSubject, trainSubject
    -  y (activity) : testActivity, trainActivity
    -  X (feature) files : testFeatures, trainFeatures
    -  label files : nameFeatures, activityLabels
4. Binds subject, activity, and feature sets; names variables 
5. Binds named subject data, activity data, and feature data into one data set called "combineData"
6. Extracts only mean and standard deviation for each measurement
    - finds mean and std features in nameFeatures
    - from combineData, selects corresponding mean and std variables, plus "subject" and "activity"
    - creates a subset called "data"
8. Adds descriptive activity names to name the activities in the data set
    - factors data$activity with levels & labels from activityLabels
10. Appropriately labels the data set with descriptive variable names from features data frame with gsub()
    - also removes special characters from variables
12. Aggregates data a new tidy data set with the average of each variable for each activity and subject
13. Stores tidy data in new file called tidydata.txt, ordered by subject and activity
