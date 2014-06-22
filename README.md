CleaningDataProject
===================

Course project for the Coursera Cleaning Data course


For this project we were asked to create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

cbind was used to combine the files for the training data into one dataset, and the files for test data into another separate dataset. The two datasets were then subsequently combined using rbind (since both had the same columns)to create one data set

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

grep was used to identify measurement variable names which contained either mean or std. A subset dataset was created containing only these variables

3. Uses descriptive activity names to name the activities in the data set

Descriptive activity names were read from the activity_labels.txt file and was used to append descriptive activity names on the combined test and training datasets

4. Appropriately labels the data set with descriptive variable names. 

Descriptive variable names were read from the features.txt file and was used to append descriptive variable names on the combined test and training datasets
  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The specified tidy data set was created using the dcast function to calculate the mean of the dataset measurements. The resulting dataset was output to a tab dleimited file called tidydata.txt

