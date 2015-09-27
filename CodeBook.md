# Codebook for Course Project  
# Coursera "Getting and Cleaning Data"  
Author: Mohamed Elkhamisy   
Date: Septemper 2015  

## Project Description
The purpose of this project is to collect, work with, and clean a data set collected from the accelerometers from the Samsung Galaxy S smartphone. The goal is to prepare tidy data that can be used for later analysis.

##Study design and data processing
The tidy data is obtained by merging and filtering matched records that had been spreaded over the folowing files :

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.
* subject_test.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* subject_train.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
###Collection of the raw data

The was collected from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and
 features and the measurements of the mean and standard deviation for each measurement are extracted and merged with the subjects and    activity types.From the previous data set, we creates a new second, independent tidy data set with the average of each variable for each activity and each subject

## Related files
* README.md,         describes how the R script is used, and how to view the final tidy data  
* run_analysis.R,    the script that is run to produce the tidy data
* tidy.txt,          the tidy output of the R script

  
## Work done to clean the data
The source files were read and processed by a single R script `run_analysis.R`.
 
1. Source files were all read into dataframes. The main (sensor-data) files are X_test.txt and X_train.txt.
2. Column names were attached to the sensor-data dataframes.
3. The subject identifiers (i.e. the person carrying the smartphone) and their activity classes (numeric) were then attached to the sensor-data.
4. The descriptive activity names were merged into the sensor-data according to the numeric activity classes.
5. The mean and standard deviation columns were extracted into a new dataframe, along with the columns identifying the subject (person) and their activity. Only those variables containing the strings "mean()" and "std()" were chosen, based on the variable descriptions in file "features_info.txt" (included with the source data).
6. The averages of the selected variables were calculated, grouped by subject and their activity. 
7. The resulting analysis was saved as tidy.txt.

## Variables in final output 'tidy.txt'

"Activity"  - description of the activity being performed by the person carrying the smartphone 
"Subject"  - numeric identifier of the person carrying the smartphone    
  
The remaining variables are the mean of each sensor variable by each Activity performed by each Subject (person). Two sensors are involved - an accelerometer ("Acc") and a gyroscope ("Gyro"), both providing measurements in X, Y, and Z axes. Gravimetric variables ("Gravity") were also derived from the accelerometer.The detailed decription of the 3rd variable is a representative example for the remaining :

### tBodyAcc_mean_X  : num
 - number of observations is 10299 
 - Summary of the data
 - Variables present in the dataset

  
"tBodyAcc-mean()-X"  
"tBodyAcc-mean()-Y"  
"tBodyAcc-mean()-Z"  
"tBodyAcc-std()-X"  
"tBodyAcc-std()-Y"  
"tBodyAcc-std()-Z"  
"tGravityAcc-mean()-X"  
"tGravityAcc-mean()-Y"  
"tGravityAcc-mean()-Z"  
"tGravityAcc-std()-X"  
"tGravityAcc-std()-Y"  
"tGravityAcc-std()-Z"  
"tBodyAccJerk-mean()-X"  
"tBodyAccJerk-mean()-Y"  
"tBodyAccJerk-mean()-Z"  
"tBodyAccJerk-std()-X"  
"tBodyAccJerk-std()-Y"  
"tBodyAccJerk-std()-Z"  
"tBodyGyro-mean()-X"  
"tBodyGyro-mean()-Y"  
"tBodyGyro-mean()-Z"  
"tBodyGyro-std()-X"  
"tBodyGyro-std()-Y"  
"tBodyGyro-std()-Z"  
"tBodyGyroJerk-mean()-X"  
"tBodyGyroJerk-mean()-Y"  
"tBodyGyroJerk-mean()-Z"  
"tBodyGyroJerk-std()-X"  
"tBodyGyroJerk-std()-Y"  
"tBodyGyroJerk-std()-Z"  
"tBodyAccMag-mean()"  
"tBodyAccMag-std()"  
"tGravityAccMag-mean()"  
"tGravityAccMag-std()"  
"tBodyAccJerkMag-mean()"  
"tBodyAccJerkMag-std()"  
"tBodyGyroMag-mean()"  
"tBodyGyroMag-std()"  
"tBodyGyroJerkMag-mean()"  
"tBodyGyroJerkMag-std()"  
"fBodyAcc-mean()-X"  
"fBodyAcc-mean()-Y"  
"fBodyAcc-mean()-Z"  
"fBodyAcc-std()-X"  
"fBodyAcc-std()-Y"  
"fBodyAcc-std()-Z"  
"fBodyAccJerk-mean()-X"  
"fBodyAccJerk-mean()-Y"  
"fBodyAccJerk-mean()-Z"  
"fBodyAccJerk-std()-X"  
"fBodyAccJerk-std()-Y"  
"fBodyAccJerk-std()-Z"  
"fBodyGyro-mean()-X"  
"fBodyGyro-mean()-Y"  
"fBodyGyro-mean()-Z"  
"fBodyGyro-std()-X"  
"fBodyGyro-std()-Y"  
"fBodyGyro-std()-Z"  
"fBodyAccMag-mean()"  
"fBodyAccMag-std()"  
"fBodyBodyAccJerkMag-mean()"  
"fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-mean()"  
"fBodyBodyGyroMag-std()"  
"fBodyBodyGyroJerkMag-mean()"  
"fBodyBodyGyroJerkMag-std()"  


