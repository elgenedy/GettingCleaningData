## Getting and Cleaning Data Course
## Code Book for final project

### Data description

#### Before transformation, general description

Human Activity Recognition Using Smartphones Dataset, carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Data was captured using the smartphone's embedded accelerometer and gyroscope and consists of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz

Two data sates were provided: 

* **Train Data Set**, 70% of the volunteers
* **Test Data Set**, the remaing 30% fo volunteers

#### After transformation

The resulting Data Set consists of 68 variables:

* activity
* subject
* 66 computed means

##### Computed Means

From all original observations, only the mean and std were considered. In the final DataSet, every variable was averaged for each activity and subject

### Variable Description

* **activity**: the possible six activities performed by volunteers
* **subject**: volunteer
* **tBodyAcc-XYZ**: Body accelaration
* **tGravityAcc-XYZ**: Gravity accelaration
* **tBodyGyro-XYZ**: Angular velocity
* **tBodyAccJerk-XYZ**: Jerk signal (linear acceleration derived in time)
* **tBodyGyroJerk-XYZ**: Jerk Signal (angular velocity derived in time)
* **tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag**: Magnitude using Euclidean norm
* **fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag**: Fast Fourier Transform

Please note:

* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions
* mean(): Mean value
* std(): Standard deviation

### Operations performed in Data

* activity_labels was ordered
* Activity_labels was decoded into activity names
* Activity name, subject and measurements were joined 
* Sets from test and training data were joined
* activity, subject and variables contianing mean() or std() in their names were selected
* New DataSet grouped by activity and subject
* Summary, with mean function, applied to all non group_by columns
* Final DS saved to txt file
