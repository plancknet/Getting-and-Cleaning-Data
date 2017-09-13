## Getting and Cleaning Data Course Project





One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The purpose
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. 

The goal is to prepare tidy data that can be used for later analysis, creating one R script called run_analysis.R that does the following:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The code run_analysis.R
The steps are:

> Merges the training and the test sets to create one data set

    1. reading test data
    2. aggregating test data in one data set
    
    3. reading train data
    4. aggregating train data in one data set

    5. join test and train data in on data set

> Appropriately labels the data set with descriptive variable names

    1. acquiring column names
    2. setting column names

> Extracts only the measurements on the mean and standard deviation for each measurement

    1. keeping subject and activity attributes 
    2. Adding extracted measurements 

> Uses descriptive activity names to name the activities in the data set

    1. merging data sets
    2. eliminating unnecessary column

> Creating independent tidy data set with the average of each variable for each activity and each subject

    1. aggregating data by subject, activity
    2. writing datasets in text files    


