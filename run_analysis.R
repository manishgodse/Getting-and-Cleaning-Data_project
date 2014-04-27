## Read files from local directory of machine
trainDatasetX<- read.table("~/data/UCI_HAR_Dataset/train/X_train.txt", header=FALSE)
trainDatasetY <- read.table("~/data/UCI_HAR_Dataset/train/y_train.txt", header=FALSE)
trainDatasetSubject <- read.table("~/data/UCI_HAR_Dataset/train/subject_train.txt", header=FALSE)
testDatasetX <- read.table("~/data/UCI_HAR_Dataset/test/X_test.txt", header=FALSE)
testDatasetY <- read.table("~/data/UCI_HAR_Dataset/test/y_test.txt", header=FALSE)
testDatasetSubject <- read.table("~/data/UCI_HAR_Dataset/test/subject_test.txt", header=FALSE)

## 1. Merges the training and the test sets to create one data set.
## Merge the training and test datasets for sets and labels to create row-wise data set using rbind() function
DatasetX <- rbind(trainDatasetX, testDatasetX)
DatasetY <- rbind(trainDatasetY, testDatasetY)
DatasetSubject <- rbind(trainDatasetSubject, testDatasetSubject)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement
## Reads the file features.txt and find the pattern the column[2] matching to mean() and std()
featuresDataset <- read.table("~/data/UCI_HAR_Dataset/features.txt", header=FALSE)
pattern <- "-mean\\()|-std\\()"
grep(pattern, featuresDataset[,2], value=TRUE)

## 3.Uses descriptive activity names to name the activities in the data set
## Reads the file "activity_labels.txt" and names the columns with "Activity_ID" and "Activity Names"
activityLabelsDataset <- read.table("~/data/UCI_HAR_Dataset/activity_labels.txt")
names(activityLabelsDataset)[1] <-paste("Activity_ID")
names(activityLabelsDataset)[2] <-paste("Activity Names")

## 4.Appropriately labels the data set with descriptive activity names
for (i in 1:561){ names(DatasetX)[i]<- featuresDataset[i, 2]}
colnames(DatasetX)

## 5. 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject
rows_DatasetX <- nrow(DatasetX)
cm <- rowMeans(DatasetX , 1:rows_DatasetX)
