# Getting and Cleaning Data Course

Analysis consists in a single R script file, named run_analysis.R

Developed in R version 3.4.2
Uses dplyr package, version 0.7.4

## Script description

Start out by reading all files into memory.
According to instructions, script should work as long as the Samsung data is in the working directory,
so all files will be loaded asuming the presence of the entire "UCI HAR Dataset" folder in the working directory

For your convenience, I've added this folder to this repo (I've excluded the Inertial Signals folders)

Since no file has headers in it, every read.csv call has a header=F

Next step is decoding activities and labels. Every label is a number which corresponds to a named activity.
For this decoding, direct idexation is used. By ordering activity_labels by number, we get the same value in number and row number.
Therefore, from initial number in y_test/y_train we get the index from activity_labels.

Next, a DS is created that joins, in this order:

* activity
* subject
* all 561 observations

Until here, everything is done to both test data and train data.

Next, both DS are joined together.

From this, a subset containing only activity, subject and variables with mean() and std() in its name is created. 
For this subset, the regular expression "std\\(\\)|mean\\(\\)" is used.

And this gives the first Data Set.

To create the independant DS, with the means for every variable for each activity and subject, 2 commands are used:

* group_by, using both activity and subject
* summarise_all, to compute the mean to every other variable

Finally, DS is saved to a text file.

Though this isn't probably considered a publication, I'd like to acknowledge:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
