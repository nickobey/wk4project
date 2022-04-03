library(dplyr)

projectData <- "getdata_projectfiles_UCI HAR Dataset.zip"

if (!file.exists(projectData)){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, projectData, method = "curl")
}
if (!file.exists("UCI HAR Dataset")){
      unzip(projectData)
}

# Reads Activity Data from "y" files
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

# Reads Features Data from "X" files
testFeatures <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
trainFeatures <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

# Reads Subject Data
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# Reads labels
nameFeatures <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Merges train and test sets into one data set; names subject, activity, and features
subjectData <- rbind(trainSubject, testSubject)
names(subjectData) <- c("subject")
activityData <- rbind(trainActivity, testActivity)
names(activityData) <- c("activity")
featuresData <- rbind(trainFeatures, testFeatures)
names(featuresData) <- nameFeatures$V2

combine <- cbind(subjectData, activityData)
combineData <- cbind(featuresData, combine)

# Extracts only Mean and Std measurements from data
findMeanStd <- nameFeatures$V2[grep("*mean\\(\\)|*std\\(\\)", nameFeatures$V2)]
selectMeanStd <- c("subject", "activity", as.character(findMeanStd))
data <- subset(combineData, select = selectMeanStd)

# Uses descriptive activity names in the data set
data$activity <- factor(data$activity, 
                        levels = activityLabels[,1], 
                        labels = activityLabels[,2])

# Removes special characters from column names
names(data) <- gsub("\\(|\\)|\\-", "", names(data))
# Appropriately labels data set with descriptive variable names
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("tBody", "timeBody", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("fBody", "frequencyBody", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyrometer", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("std", "Std", names(data))

#Create second tidy data set with average of each variable for each  
#activity and each subject. Saves as txt file
tidyData <- aggregate(. ~subject + activity, data, mean)
tidyData <- tidyData[order(tidyData$subject, tidyData$activity),]
write.table(tidyData, file = "tidydata.txt", row.names = FALSE)