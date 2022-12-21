##download the zip file containing the entire data set
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./dataset.zip")
##unzip the zip file 
library("utils")
unzip("./dataset.zip")
##create a list of colum names
col_names <- read.table("./UCI HAR Dataset/features.txt")[,2]
##read the test data set into R
testdata <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = col_names)
##read activity names for testdata
testdata_activitynames <- read.table("./UCI HAR Dataset/test/y_test.txt")
#make activity names in test dataset more decriptive
testdata_activitynames$V1[testdata_activitynames$V1 == '1'] <- 'Walking'
testdata_activitynames$V1[testdata_activitynames$V1 == '2'] <- 'Walking Upstairs'
testdata_activitynames$V1[testdata_activitynames$V1 == '3'] <- 'Walking Downstairs'
testdata_activitynames$V1[testdata_activitynames$V1 == '4'] <- 'Sitting'
testdata_activitynames$V1[testdata_activitynames$V1 == '5'] <- 'Standing'
testdata_activitynames$V1[testdata_activitynames$V1 == '6'] <- 'Laying'
names(testdata_activitynames)[1] = "Activity"
##include activity names in test data
testdata <- cbind(testdata,testdata_activitynames)
##read the train dataset into R
traindata <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = col_names)
##read activity names for train dataset
traindata_activitynames <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("Activity"))
##make activity names in train dataset more descriptive
traindata_activitynames$Activity[traindata_activitynames$Activity == '1']<- 'Walking'
traindata_activitynames$Activity[traindata_activitynames$Activity == '2']<- 'Walking Upstairs'
traindata_activitynames$Activity[traindata_activitynames$Activity == '3']<- 'Walking Downstairs'
traindata_activitynames$Activity[traindata_activitynames$Activity == '4']<- 'Sitting'
traindata_activitynames$Activity[traindata_activitynames$Activity == '5']<- 'Standing'
traindata_activitynames$Activity[traindata_activitynames$Activity == '6']<- 'Laying'
##include activity names in traindata
traindata <- cbind(traindata, traindata_activitynames)
##Create merged data set
mergeddata <- rbind(testdata, traindata)
##identify cols with mean
meancols <- grep("mean()", names(mergeddata), value = TRUE)
##identify cols with std
stdcols <- grep("std()", names(mergeddata), value = TRUE)
##collect all cols reqd 
reqdcol <- c(meancols, stdcols, "Activity")
##loading the dplyr library
library("dplyr")
## creating data frame with only mean and std
mergedata_mean_std <- select(mergeddata, reqdcol)
##grouping data by activity to new dataset
tidy_merged_data_by_activity <- group_by(mergedata_mean_std, Activity)