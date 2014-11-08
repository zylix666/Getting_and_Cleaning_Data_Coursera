Getting_and_Cleaning_Data_Coursera
==================================
Project Descriptions : 
 You should create one R script called run_analysis.R that does the following. 

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3  Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


  Data Source URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
===================================
  1. Download the data source and put into a folder on your local drive. Unzip the file and you will have a folder named, UCI HAR Dataset
  2. Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.
  3. Run source("run_analysis.R") or Ctrl+Shift+Enter, then it will generate a new file HARUSD_means.txt in your working directory.


