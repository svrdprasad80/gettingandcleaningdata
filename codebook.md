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

Variables

testdata_fea - table contents of X_test.txt(features data test)
traindata_fea - table contents of X_train.txt(features data train)
data_fea  - Measurement data. Combined data set of the two above variables
testdata_sub - table contents of subject_test.txt(subject test data)
traindata_sub - table contents of subject_train.txt(subject train data)
data_sub - Subjects. Combined data set of the two above variables
testdata_act - table contents of y_test.txt(actvity test data)
traindata_act - table contents of y_train.txt(actvity train data)
data_act - Data Labels. Combined data set of the two above variables.
features_names - table contents of features.txt
tidy_data - subsetted, human-readable data ready for output according to project description.
avg- second tiny data set with average of each variable for each activity and subject
