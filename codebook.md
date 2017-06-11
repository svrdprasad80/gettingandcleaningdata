Code Book 
original data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Steps involved in the Process

The script run_analysis.R performs the following process to clean up the data and create tiny data sets:

Merge the training and test sets to create one data set.

Reads features.txt and uses only the measurements on the mean and standard deviation for each measurement.

Reads activity_labels.txt and applies human readable activity names 

Labels the data set with descriptive names.

Merges the features with activity labels and subject IDs. The result is saved as tidy_data

The average of each measurement for each activity and each subject is merged to a second data set. The result is saved as indepent_data.txt.

output:
In tidy_data
The first column contains subject IDs.
The second column contains activity names.
The last 66 columns are measurements.
Subject IDs are integers between 1 and 30.

indepent_data.txt.
The first column contains subject IDs.
The second column contains activity names.
The averages for each of the 66 attributes are in columns 3-68.

