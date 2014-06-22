## The purpose of this project is to demonstrate your ability to collect, 
## work with, and clean a data set. The goal is to prepare tidy data that can
## be used for later analysis

library(reshape2)

## Read labels for the 561 features recorded
dataHeader <- read.table(".//UCI HAR Dataset/features.txt", header=FALSE, colClasses="character")

## Read the activity labels
actLabels <- read.table(".//UCI HAR Dataset/activity_labels.txt", header=FALSE, colClasses="character", col.names=c("activityID", "activityName"))

## Read the training data sets
trainSubjects <- read.table(".//UCI HAR Dataset/train/subject_train.txt", header=FALSE, colClasses="integer",col.names="subjectID")
trainActivities <- read.table(".//UCI HAR Dataset/train/y_train.txt", header=FALSE, colClasses="integer",col.names="activityID")
trainData <- read.table(".//UCI HAR Dataset/train/X_train.txt", header=FALSE, colClasses="numeric")

## Label the dataset with descriptive vartiable names
names(trainData) <- dataHeader[,2]

## Join the training data sets into one dataset
trainData <- cbind(trainData, trainActivities, trainSubjects)


## Read the test data sets
testSubjects <- read.table(".//UCI HAR Dataset/test/subject_test.txt", header=FALSE, colClasses="integer",col.names="subjectID")
testActivities <- read.table(".//UCI HAR Dataset/test/y_test.txt", header=FALSE, colClasses="integer",col.names="activityID")
testData <- read.table(".//UCI HAR Dataset/test/X_test.txt", header=FALSE, colClasses="numeric")

## Label the dataset with descriptive vartiable names
names(testData) <- dataHeader[,2]

## Join the test data sets into one dataset
testData <- cbind(testData, testActivities, testSubjects)


## Merge the train and test data sets into one dataset
ds <- rbind(trainData, testData)

## Extract only the mean and standard devation features of each measurement 
ds <- melt(ds, id=c("subjectID", "activityID"), measure.vars=grep("mean|std|ID",names(ds)))

## Add descriptive activity names
ds <- merge(ds, actLabels, by.x="activityID", by.y="activityID")



## Create a second, independent tidy dataset with the average of each variable
## for each activity and each subject
## A separate record exists for each subject and each activity containing the mean
## of each measurement
ds2 <- dcast(ds, subjectID + activityName ~ variable,mean)
write.table(ds2, "tidydata.txt", sep="\t")

