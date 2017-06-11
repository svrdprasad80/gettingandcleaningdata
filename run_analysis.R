#loading required libraries
library(data.table)
library(plyr)

#creating a directory if one do not already exists to extract the data
if(!file.exists("./data")){dir.create("./data")}
#url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#downloading the file
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
#Extracting
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#list of files in the unzipped
files <- file.path("./data", "UCI HAR Dataset")
listoffiles <-list.files(files, recursive=TRUE)
listoffiles
#loading data from files to console
#activity data
testdata_act <- read.table(file.path(files, "test" , "y_test.txt" ),header = FALSE)
traindata_act <- read.table(file.path(files, "train" , "y_train.txt" ),header = FALSE)
#subject data
testdata_sub <- read.table(file.path(files, "test" , "subject_test.txt" ),header = FALSE)
traindata_sub <- read.table(file.path(files, "train" , "subject_train.txt" ),header = FALSE)
#features data
testdata_fea <- read.table(file.path(files, "test" , "X_test.txt" ),header = FALSE)
traindata_fea <- read.table(file.path(files, "train" , "X_train.txt" ),header = FALSE)

#Merging the training and the test sets to create one data set
data_act <- rbind(testdata_act, traindata_act)
data_sub <- rbind(testdata_sub, traindata_sub)
data_fea <- rbind(testdata_fea, traindata_fea)

# To extract measurements on the mean and standard deviation for each measurement names has to extracted and assigned to files
names(data_sub)<-c("sub")
names(data_act)<- c("act")
features_names <- read.table(file.path(files, "features.txt"),head=FALSE)
names(data_fea) <- features_names$V2


#combing the data of activity and subject
data_1 <- cbind(data_sub, data_act)
tidy_data <- cbind(data_fea, data_1)

#extracting only the measurements on the mean and standard deviation for each measurement
#extracting only the required feature mand and SD
required_fea <- features_names$V2[grep("mean\\(\\)|std\\(\\)", features_names$V2)]
requirednames <- c(as.character(required_fea), "sub", "act")
mean_sd_data <- subset(tidy_data, select = requirednames)

#Using descriptive activity names to name the activities in the data set
act_names <- read.table(file.path(files, "activity_labels.txt"), header = FALSE)

#Appropriately labels the data set with descriptive variable names
names(tidy_data) <- gsub("^t", "time", names(tidy_data))
names(tidy_data) <- gsub("^f", "frequency", names(tidy_data))
names(tidy_data) <- gsub("^Acc", "accelerometer", names(tidy_data))
names(tidy_data) <- gsub("^Gyro", "gyroscope", names(tidy_data))
names(tidy_data) <- gsub("^Mag", "magnitue", names(tidy_data))
names(tidy_data) <- gsub("^BodyBody", "body", names(tidy_data))

#From the data set tidy_data, creates a second, independent tidy data set with the average of each variable for each activity and each subject
avg <- aggregate(.~sub+act, tidy_data, mean)
avg <- avg[order(avg$sub, avg$act), ]
write.table(avg, "indepent_data.txt", row.name = FALSE)





