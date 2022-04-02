# fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileURL, destfile = "projectData.zip", method = curl)
# unzip("projectData.zip)

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("class", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "class")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "class")

# 1. Merges the training and the test sets to create one data set.
x_Data <- rbind(x_train, x_test)
y_Data <- rbind(y_train, y_test)
subject_Data <- rbind(subject_train, subject_test)
merge_Data <- cbind(subject_Data, y_Data, x_Data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
meanAndStd <- merge_Data %>% select(subject, code, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set
meanAndStd <- activities[meanAndStd$code, 2]

# 4. Appropriately labels the data set with descriptive variable names. 
names(meanAndStd)[2] <- "activity"
names(meanAndStd) <- gsub("^t", "Time", names(meanAndStd))
names(meanAndStd) <- gsub("tBody", "TimeBody", names(meanAndStd))
names(meanAndStd) <- gsub("^f", "Frequency", names(meanAndStd))
names(meanAndStd) <- gsub("fBody", "FrequencyBody", names(meanAndStd))
names(meanAndStd) <- gsub("Acc", "Accelerometer", names(meanAndStd))
names(meanAndStd) <- gsub("Gyro", "Gyrometer", names(meanAndStd))
names(meanAndStd) <- gsub("Mag", "Magnitude", names(meanAndStd))
names(meanAndStd) <- gsub("BodyBody", "Body", names(meanAndStd))
#names(meanAndStd) <- gsub(".", "", names(meanAndStd))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.