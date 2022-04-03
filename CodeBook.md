# CodeBook - Getting and Cleaning Data Project

## Data Transformation

-   Merged training and test data sets to create one data set

-   Extracted only the mean and standard deviation for each measurement

-   Used descriptive names for the activities in the data set (from activity_labels.txt)

-   Appropriately labeled the data set with descriptive variable names (from features.txt)

-   Created a second, independent tidy data set with the average of each variable for each activity and subject

## Description

### Identifiers

subject : identifier for each individual subject (30 total subjects)

activity : the activity preformed when the measurement was taken (6 activities per subject)

### Activities

1.  WALKING

2.  WALKING_UPSTAIRS

3.  WALKING_DOWNSTAIRS

4.  SITTING

5.  STANDING

6.  LAYING

### Measurements

Device measurements for during each activity. Only the Mean and Standard Deviation (Std) for each included in tidydata.txt

Note: variables ending in "-XYZ" are split into 3 separate measurements

-   timeBodyAccelerometer-XYZ

-   timeGravityAccelerometer-XYZ

-   timeBodyAccelerometerJerk-XYZ

-   timeBodyGyrometer-XYZ

-   timeBodyGyrometerJerk-XYZ

-   timeBodyAccelerometerMagnitude

-   timeGravityAccelerometerMagnitude

-   timeBodyAccelerometerJerkMagnitude

-   timeBodyGyrometerMagnitude

-   timeBodyGyrometerJerkMagnitude

-   frequencyBodyAccelerometer-XYZ

-   frequencyBodyAccelerometerJerk-XYZ

-   frequencyBodyGyrometer-XYZ

-   frequencyBodyAccelerometerMagnitude

-   frequencyBodyAccelerometerJerkMagnitude

-   frequencyBodyGyrometerMagnitude

-   frequencyBodyGyrometerJerkMagnitude
