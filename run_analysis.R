##Course 3 - Getting and Cleaning Data Final project

library(dplyr)

## Start out by reading all files into memory.
## According to instructions, script should work as long as the Samsung data is in the working directory,
## so all files will be loaded asuming the presence of the entire "UCI HAR Dataset" folder in the wd

## No file has headers in it, so every read.csv call has a header=F

test_observations <- read.csv("UCI HAR Dataset/test/X_test.txt", header = F, sep = "")
train_observations <- read.csv("UCI HAR Dataset/train/X_train.txt", header = F, sep = "")

test_labels <- read.csv("UCI HAR Dataset/test/y_test.txt", header = F, sep = "")
train_labels <- read.csv("UCI HAR Dataset/train/y_train.txt", header = F, sep = "")

test_subjects <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = F, sep = "")
train_subjects <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = F, sep = "")

activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", header = F, sep = "")
features <- read.csv("UCI HAR Dataset/features.txt", header = F, sep = "")

## Now, to give proper names to variables in the observations DS

names(test_observations)<-features[,2]
names(train_observations)<-features[,2]

## Decode activities and labels

## Give names to variables. To assure that names can be used to access contents
names(activity_labels) <- c("number", "description")
names(test_labels) <- c("activity")
names(train_labels) <- c("activity")

## By ordering activity_labels by number, number and index are the same, which allows to use the number in
## test_labels and train_labels directly as an index for activity_labels
activity_labels <- arrange(activity_labels, number)

## Using indexation to get the activity name and mutate DS
test_labels <- mutate(test_labels, activity = activity_labels[test_labels$activity,2])
train_labels <- mutate(train_labels, activity = activity_labels[train_labels$activity,2])

##gather up all test data:
names(test_subjects)<-c("subject")
test_data<-cbind(test_subjects, test_labels, test_observations)

##gather up all train data:
names(train_subjects)<-c("subject")
train_data<-cbind(train_subjects, train_labels, train_observations)

## join test and train data
temp_data <- rbind(train_data, test_data)

## Finally, create a DS with only the required variables
samsung_data <- temp_data[,c(1,2,grep("std\\(\\)|mean\\(\\)", names(temp_data)))]

## some memory clean up 
rm(list=c("activity_labels","features","test_data","test_labels",
          "test_observations","test_subjects","train_data","train_labels",
          "train_observations","train_subjects","temp_data"))

## Now, lets create the independant DS, with the means for every variable for each activity and subject
## First, create the grouped by DS:
temp_data <- group_by(samsung_data, activity, subject)

## Then, summarise all other columns with the mean function
summarised_samsung_data <- summarise_all(temp_data, funs(mean))

## Finally, save summarised_samsung_data to a text file
write.table(summarised_samsung_data, "summarised_samsung_data.txt", row.names = F)

## as a wrap up, some memory cleaning, leaving only samsung_data and summarised_samsung_data
rm(temp_data)



