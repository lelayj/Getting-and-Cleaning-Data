CODE BOOK
-----------
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data were obtained. See License at the bottom of the document.

[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are the files described below. We will get the folder UCI HAR Dataset.zip to be extracted in the working directory.

* Each of six activities was carried out by each of thirty volunteers (age bracket of 19-48 years).  
The activities are alphabetically LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS, located in the file "UCI HAR Dataset/activity_labels.txt". They are also labeled from 1 to 6 in this file but not according to the alphabetic order.

* The persons were wearing a smartphone (Samsung Galaxy S II) on the waist, and using its embedded accelerometer and gyroscope, raw signals (linear acceleration tAcc-XYZ and angular velocity tGyro-XYZ) were captured at a constant rate of 50 Hz (that is 50 times/second). 
These were sampled in fixed-width sliding windows of 2.56 seconds each giving 128 readings/window : 50 readings/second multiplied by 2.56 seconds = 128 readings.  
The acceleration signal was also separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).
Each signal has 3 coordinates (X, Y, Z), so each window gives 3 x 3 = 9 different sorts of 128 data each that were recorded in files, by rows of 128 elements either in the nine files of "UCI HAR Dataset/train/Inertial Signals" or in the nine files of "UCI HAR Dataset/test/Inertial Signals". This partition corresponds to the 70% of the subjects randomly selected for generating the training data, the other 30%  generating the test data.  

* The activity and the subject  who carried out the activity are recorded at a same number of row in the files "UCI HAR Dataset/train/y_train.txt" and "UCI HAR Dataset/train/subject_train.txt", respectively, if selected for the training set, and similarly if selected for the test set. The data mentioned above are recorded at this same number of row as well.  
Note that several rows show the same activity and the same subject, due to the fact that there are several records for the same subject carrying out the same activity.

* A series of calculations (such as derivation, magnitude using the Euclidean norm, Fast Fourier Transform, then mean, standard deviation ...) were performed on the rows of same number in the nine files of "UCI HAR Dataset/train/Inertial Signals" giving a row of same number of 561 elements in the file "UCI HAR Dataset/train/X_train", and similarly for the test set.  
The results of these calculations are normalized and bounded within [-1,1], so are without any units.  
The names of these 561 variables are located in the file "UCI HAR Dataset/features.txt".

* More technical details can be found in the files "UCI HAR Dataset/README.txt" and "UCI HAR Dataset/features_info.txt".

**Regarding the tidy data set "Course Project Tidy Data Set.txt" output of the code "run_analysis.R", both located in the working directory**

The first two variables are "activity" and "subject" and only 66 variables were kept among the above-mentioned 561 variables, namely those that are a mean or a standard deviation. Furthermore we saw above that several rows show the same activity and the same subject, due to the fact that there are several records (several sliding windows) for the same subject carrying out the same activity. Therefore it was relevant to average the data that were obtained in this case, giving the tidy data set made of the average of each variable for each activity and each subject.
Thus this tidy data set has 68 columns and has 180 rows due to the fact that each activity was carried out by each subject, giving 6 activities x 30 subjects = 180 rows. The first 30 elements of the column "activity" show 30 times the same activity: "LAYING", and the first 30 elements of the column "subject" are 1, 2, ..., 30. Then it will be 30 times "SITTING" and 1, 2, ..., 30 again. Then the next activity in the alphabetic order, and 1, 2, ..., 30, etc.

On one hand, using the programming language R we had to replace R non-allowed characters (for variables) seen in the names of these 561 variables with R allowed ones: a-z,A-Z,0-9,«.»,«_», on the other hand in order to label the data set with descriptive variable names, we replaced :  
BodyAcc with BodyLinearAcceleration, GravityAcc with GravityAcceleration, Gyro with AngularVelocity, Mag with Magnitude, std with standardDeviation, and at last BodyBody with Body where needed (it does actually seem that there is a mistake in the names of the given list of "features.txt" from index 516 to index 554).  
However we did not make any changes in the content of the file "features.txt", we only made modifications in the data frame created from it.

**The variables of the tidy data set "Course Project Tidy Data Set.txt" are the following :**
 
```
note : "t" and "f" indicate time and frequency domain variables, respectively
```    
```|
1                                                         activity
2                                                          subject
3                          tBodyLinearAcceleration_mean._X_average
4                          tBodyLinearAcceleration_mean._Y_average
5                          tBodyLinearAcceleration_mean._Z_average
6             tBodyLinearAcceleration_standardDeviation._X_average
7             tBodyLinearAcceleration_standardDeviation._Y_average
8             tBodyLinearAcceleration_standardDeviation._Z_average
9                             tGravityAcceleration_mean._X_average
10                            tGravityAcceleration_mean._Y_average
11                            tGravityAcceleration_mean._Z_average
12               tGravityAcceleration_standardDeviation._X_average
13               tGravityAcceleration_standardDeviation._Y_average
14               tGravityAcceleration_standardDeviation._Z_average
15                     tBodyLinearAccelerationJerk_mean._X_average
16                     tBodyLinearAccelerationJerk_mean._Y_average
17                     tBodyLinearAccelerationJerk_mean._Z_average
18        tBodyLinearAccelerationJerk_standardDeviation._X_average
19        tBodyLinearAccelerationJerk_standardDeviation._Y_average
20        tBodyLinearAccelerationJerk_standardDeviation._Z_average
21                            tBodyAngularVelocity_mean._X_average
22                            tBodyAngularVelocity_mean._Y_average
23                            tBodyAngularVelocity_mean._Z_average
24               tBodyAngularVelocity_standardDeviation._X_average
25               tBodyAngularVelocity_standardDeviation._Y_average
26               tBodyAngularVelocity_standardDeviation._Z_average
27                        tBodyAngularVelocityJerk_mean._X_average
28                        tBodyAngularVelocityJerk_mean._Y_average
29                        tBodyAngularVelocityJerk_mean._Z_average
30           tBodyAngularVelocityJerk_standardDeviation._X_average
31           tBodyAngularVelocityJerk_standardDeviation._Y_average
32           tBodyAngularVelocityJerk_standardDeviation._Z_average
33                  tBodyLinearAccelerationMagnitude_mean._average
34     tBodyLinearAccelerationMagnitude_standardDeviation._average
35                     tGravityAccelerationMagnitude_mean._average
36        tGravityAccelerationMagnitude_standardDeviation._average
37              tBodyLinearAccelerationJerkMagnitude_mean._average
38 tBodyLinearAccelerationJerkMagnitude_standardDeviation._average
39                     tBodyAngularVelocityMagnitude_mean._average
40        tBodyAngularVelocityMagnitude_standardDeviation._average
41                 tBodyAngularVelocityJerkMagnitude_mean._average
42    tBodyAngularVelocityJerkMagnitude_standardDeviation._average
43                         fBodyLinearAcceleration_mean._X_average
44                         fBodyLinearAcceleration_mean._Y_average
45                         fBodyLinearAcceleration_mean._Z_average
46            fBodyLinearAcceleration_standardDeviation._X_average
47            fBodyLinearAcceleration_standardDeviation._Y_average
48            fBodyLinearAcceleration_standardDeviation._Z_average
49                     fBodyLinearAccelerationJerk_mean._X_average
50                     fBodyLinearAccelerationJerk_mean._Y_average
51                     fBodyLinearAccelerationJerk_mean._Z_average
52        fBodyLinearAccelerationJerk_standardDeviation._X_average
53        fBodyLinearAccelerationJerk_standardDeviation._Y_average
54        fBodyLinearAccelerationJerk_standardDeviation._Z_average
55                            fBodyAngularVelocity_mean._X_average
56                            fBodyAngularVelocity_mean._Y_average
57                            fBodyAngularVelocity_mean._Z_average
58               fBodyAngularVelocity_standardDeviation._X_average
59               fBodyAngularVelocity_standardDeviation._Y_average
60               fBodyAngularVelocity_standardDeviation._Z_average
61                  fBodyLinearAccelerationMagnitude_mean._average
62     fBodyLinearAccelerationMagnitude_standardDeviation._average
63              fBodyLinearAccelerationJerkMagnitude_mean._average
64 fBodyLinearAccelerationJerkMagnitude_standardDeviation._average
65                     fBodyAngularVelocityMagnitude_mean._average
66        fBodyAngularVelocityMagnitude_standardDeviation._average
67                 fBodyAngularVelocityJerkMagnitude_mean._average
68    fBodyAngularVelocityJerkMagnitude_standardDeviation._average
 
```
License :

Use of this dataset in publications must be acknowledged by referencing the following publication [1]


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
