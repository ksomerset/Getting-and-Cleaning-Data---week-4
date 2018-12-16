# Getting-and-Cleaning-Data---week-4

This repository is for the submission of data for the Coursera course Getting and Cleaning data, week 4 assignment. 

Data description. The two X datasets (train and test) include measurements from 30 subjects wearing waist-mounted smartphones doing six activities, such as walking and sitting. The two Y datasets include information on the 30 subjects. 

Code. The code reads the relevant files, merges the train and test files, and extracts just the variables relating to mean and SD measurements. It then calculates the mean for each of the extracted measurements, for each subject and activity.

Resulting dataset. The final dataset includes, for all measurements related to a mean or SD measurement, the mean specific to each subject and activity.

The R script run_analysis.R was developed that will complete the following:
•	Merges the training and the test sets to create one data set.
•	Extracts only the measurements on the mean and standard deviation for each measurement.
•	Uses descriptive activity names to name the activities in the data set
•	Appropriately labels the data set with descriptive variable names.
•	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
