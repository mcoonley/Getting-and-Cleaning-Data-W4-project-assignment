---
title: Human Activity Using Smartphones Dataset
author: Marianne L. Coonley
date: December 11, 2016

---

## Project Description
  The purpose of this project is to demonstrate the ability to collect, work with, 
  and clean a data set. The goal is to prepare tidy data that can be used for 
  later analysis.

I have created one R script called run_analysis.R that does the following:
  
1)  Merges the training and the test sets to create one data set
2)  Extracts only the measurements on the mean and standard deviation for each measurement
3)  Uses descriptive activity names to name the activities in the data set
4)  Appropriately labels the data set with descriptive variable names
5)  From the data set in step 4, creates a second, independent tidy data set with the 
    average of each variable for each activity and each subject

##Study design and data processing

###Collection of the raw data
The data was available at the UCI Machine Learning Repository website.

###Notes on the original (raw) data 
As detailed in the features_info.txt file included with the data set:
  
The features selected for this database come from the accelerometer and gyroscope 
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to 
denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time 
to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude 
of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##Creating the tidy datafile

###Guide to create the tidy data file
The data was downloaded from the following website as a zip file:
  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once the file was unzipped, the following files were read in to R:

features.txt, activity_labels.txt, X_test.txt, y_test.txt, x_train.txt, 
y_train.txt, subject_test.txt, subject_train.text
###Cleaning of the data
Once the data was read in, the test and training data was combined and column heading 
were added.  The information regarding only mean and standard deviation were then 
extracted. Next the subject and activity information was added, activity labels were
updated to reflect the proper terminology.  Column headings were changed to create more
easily understandable headings.  Lastly, the subject and activity columns were 'melted'
to allow the creation of the tidy data set that summarizes the average of each variable 
in relation to subject and activity.

##Description of the variables in the tidydata.txt file
The tidydata.txt (or tidydata.csv) includes 180 objects with 68 variables.
The 180 objects are comprised of the 30 subjects with the data from the six different
activities, which include walking, walking upstairs, walking downstairs, sitting,
standing and laying.
The variables are comprised of three x,y, & z readings in relation to various accelerometer
and gyroscopic readings in relation to acceleration signals as well gravitational and body
motion components at certain times and frequencies.

###Variables
1)  subject - interger variable ranging from 1:30 representing the 30 test subjects
2)  activity - character variable specifying which of the six activities the information
    is related.  The six activities include: walking, walking upstairs, walking downstairs,
    sitting, laying and standing.
3-5) The x,y, & z variables in relation to the mean of body acceleration over time in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
6-8) The x,y, & z variables in relation to the standard deviation of body acceleration over time
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
9-11) The x,y, & z variables in relation to the mean of gravity acceleration over time in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
12-14) The x,y, & z variables in relation to the standard deviation of gravity acceleration over time
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
15-17) The x,y, & z variables in relation to the mean of body acceleration jerk signals over time in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
18-20) The x,y, & z variables in relation to the standard deviation of body acceleration jerk signals over time
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
21-23) The x,y, & z variables in relation to the mean of body gyroscopics over time in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
24-26) The x,y, & z variables in relation to the standard deviation of body gyroscopics over time
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
27-30) The x,y, & z variables in relation to the mean of body gyroscopics jerk signals over time in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
31-33) The x,y, & z variables in relation to the standard deviation of body gyroscopics jerk signals over time
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
34) The measurements in relation to the mean of body acceleration magnitude over time in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
35) The measurements in relation to the standard deviation of body acceleration magnitude over time
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
36) The measurements in relation to the mean of gravity acceleration magnitude over time in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
37) The measurements in relation to the standard deviation of gravity acceleration magnitude over time
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
38) The measurements in relation to the mean of body gyroscopic magnitude over time in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
39) The measurements in relation to the standard deviation of body gyroscopic magnitude over time
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
40) The measurements in relation to the mean of body gyroscopic jerk signal magnitude
    over time in relation to the activity specified in variable 2 for the subject specified in variable 1.
41) The measurements in relation to the standard deviation of body gyroscopicjerk signal
    magnitude over time in relation to the activity specified in variable 2 for the subject specified in variable 1.
42-44) The x,y, & z variables in relation to the frequency of mean of body acceleration in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
45-47) The x,y, & z variables in relation to the frequency of the standard deviation of body acceleration in 
    relation to the activity specified in variable 2 for the subject specified in variable 1.
48-50) The x,y, & z variables in relation to the frequency of mean of body acceleration jerk signal in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
51-53) The x,y, & z variables in relation to the frequency of the standard deviation of body acceleration jerk signal in 
    relation to the activity specified in variable 2 for the subject specified in variable 1.
54-56) The x,y, & z variables in relation to the frequency of mean of body gyroscopic in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
57-59) The x,y, & z variables in relation to the frequency of the standard deviation of body gyroscopics in 
    relation to the activity specified in variable 2 for the subject specified in variable 1.
61) The measurements in relation to the frequency of the mean of body acceleration magnitude in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
62) The measurements in relation to the frequency of the stndard deviation of body acceleration 
    magnitude in relation to the activity specified in variable 2 for the subject specified in variable 1.
63) The measurements in relation to the frequency of the meana of gravity acceleration magnitude in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
64) The measurements in relation to the frequency of the standard deviation of gravity acceleration magnitude 
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
65) The measurements in relation to the frequency of mean of body gyroscopic magnitude in relation
    to the activity specified in variable 2 for the subject specified in variable 1.
66) The measurements in relation to the frequency of the standard deviation of body gyroscopic 
    magnitude in relation to the activity specified in variable 2 for the subject specified in variable 1.
67) The measurements in relation to the frequency of the mean of body gyroscopic jerk signal magnitude
    in relation to the activity specified in variable 2 for the subject specified in variable 1.
68) The measurements in relation to the frequency of the standard deviation of body gyroscopicjerk signal
    magnitude in relation to the activity specified in variable 2 for the subject specified in variable 1.