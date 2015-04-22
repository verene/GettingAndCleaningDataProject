## Code Book

### Variables:

Activity
 - One of the following six physical activities: 
   - WALKING
   - WALKING_UPSTAIRS
   - WALKING_DOWNSTAIRS
   - SITTING
   - STANDING
   - LAYING

Subject
 - Numerals 1 through 30, indicating one of thirty participants in the study

Motion data captured:
 - Note about units: data were normalized and bounded between [1,-1] in the original study (see README.txt file available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#). Since they have been normalized, feature data included in TidyData.txt for this project have no units.
 - Key to variable names:
   - "t" denotes the time domain, "f" denotes the frequency domain
   - "Body" indicates the component of the motion attributed to the body (including acceleration other than that due to gravity), and "Gravity" indicates a gravitational motion component, assumed in the original study to have only low frequencies (<=0.3 Hz).
   - "Acc" indicates linear acceleration (typically recorded in units of m/s^2), "AccJerk" indicates change in linear acceleration over time (typically recorded in units of m/s^3), "Gyro" indicates angular acceleration (typically recorded in units of rad/s^2), "GyroJerk" indicates change in angular acceleration over time (typically recorded in units of rad/s^3).
   - "mean()" indicates the arithmatic mean of values recorded by the smartphone at a frequency of 50-hertz, sampled within a 2.56 second sliding window.
   - "X", "Y", and "Z" indicate the spatial vector component of the motion; "Mag" indicates the 3-Dimensional magnitude of the signal calculated using the Euclidean norm. 
 - The variables included in the data set are arithmatic means of the following measurements:
   - "tBodyAcc-mean()-X" 
   - "tBodyAcc-mean()-Y"
   - "tBodyAcc-mean()-Z"
   - "tBodyAcc-std()-X"   
   - "tBodyAcc-std()-Y"
   - "tBodyAcc-std()-Z"
   - "tGravityAcc-mean()-X"
   - "tGravityAcc-mean()-Y"
   - "tGravityAcc-mean()-Z"
   - "tGravityAcc-std()-X"
   - "tGravityAcc-std()-Y"
   - "tGravityAcc-std()-Z"
   - "tBodyAccJerk-mean()-X"
   - "tBodyAccJerk-mean()-Y"
   - "tBodyAccJerk-mean()-Z"
   - "tBodyAccJerk-std()-X"
   - "tBodyAccJerk-std()-Y"
   - "tBodyAccJerk-std()-Z"
   - "tBodyGyro-mean()-X"
   - "tBodyGyro-mean()-Y"
   - "tBodyGyro-mean()-Z"
   - "tBodyGyro-std()-X"
   - "tBodyGyro-std()-Y"
   - "tBodyGyro-std()-Z"
   - "tBodyGyroJerk-mean()-X"
   - "tBodyGyroJerk-mean()-Y"
   - "tBodyGyroJerk-mean()-Z"
   - "tBodyGyroJerk-std()-X"
   - "tBodyGyroJerk-std()-Y"
   - "tBodyGyroJerk-std()-Z"
   - "tBodyAccMag-mean()"
   - "tBodyAccMag-std()"
   - "tGravityAccMag-mean()"
   - "tGravityAccMag-std()"
   - "tBodyAccJerkMag-mean()"
   - "tBodyAccJerkMag-std()"          
   - "tBodyGyroMag-mean()"
   - "tBodyGyroMag-std()"
   - "tBodyGyroJerkMag-mean()"
   - "tBodyGyroJerkMag-std()"
   - "fBodyAcc-mean()-X"
   - "fBodyAcc-mean()-Y"
   - "fBodyAcc-mean()-Z"
   - "fBodyAcc-std()-X"   
   - "fBodyAcc-std()-Y"
   - "fBodyAcc-std()-Z"
   - "fBodyAcc-meanFreq()-X"
   - "fBodyAcc-meanFreq()-Y"
   - "fBodyAcc-meanFreq()-Z"
   - "fBodyAccJerk-mean()-X"
   - "fBodyAccJerk-mean()-Y"           
   - "fBodyAccJerk-mean()-Z"          
   - "fBodyAccJerk-std()-X"
   - "fBodyAccJerk-std()-Y"
   - "fBodyAccJerk-std()-Z"
   - "fBodyAccJerk-meanFreq()-X"      
   - "fBodyAccJerk-meanFreq()-Y"
   - "fBodyAccJerk-meanFreq()-Z"
   - "fBodyGyro-mean()-X"
   - "fBodyGyro-mean()-Y" 
   - "fBodyGyro-mean()-Z"
   - "fBodyGyro-std()-X"
   - "fBodyGyro-std()-Y"
   - "fBodyGyro-std()-Z"  
   - "fBodyGyro-meanFreq()-X"
   - "fBodyGyro-meanFreq()-Y"
   - "fBodyGyro-meanFreq()-Z"
   - "fBodyAccMag-mean()" 
   - "fBodyAccMag-std()"
   - "fBodyAccMag-meanFreq()"
   - "fBodyBodyAccJerkMag-mean()"
   - "fBodyBodyAccJerkMag-std()"      
   - "fBodyBodyAccJerkMag-meanFreq()"
   - "fBodyBodyGyroMag-mean()"
   - "fBodyBodyGyroMag-std()"
   - "fBodyBodyGyroMag-meanFreq()"    
   - "fBodyBodyGyroJerkMag-mean()"
   - "fBodyBodyGyroJerkMag-std()"
   - "fBodyBodyGyroJerkMag-meanFreq()"

### Data:

 - ORIGINAL STUDY:

Raw data was collected from an original study described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the original study captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


 - CURRENT PROJECT:

The data included in the current data set are arithmatic means of time and frequency means and standard deviations of tri-axial linear acceleration and tri-axial angular velocity. The means were calculated for each combination of Subject and Activity (180 combinations total).


### Transformations performed to clean up the data

 - ORIGINAL STUDY:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

 - CURRENT PROJECT:

1. Original study data was read in using the read.table() function in R, using default parameter settings. Study data was retrieved from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. Training and testing data were merged into the same tables. Subject, activity, and features were then merged together into a single table.

3. Columns were labeled with appropriate names, with feature names taken from the features.txt file, available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

4. Features not containing "mean" or "std" in their feature name were discarded

5. Activities, coded 1 through 6, were replaced with descriptive names, taken from the activity_labels.txt file, available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

6. A second tidy data set was created by using the melt() R function, with "Subject" and "Activity" as id fields, and then by using the dcast() R function to calculate the mean of the features by "Subject" and "Activity", creating a final data table of 180 rows (6 activities x 30 subjects) by 81 columns ("Subject" + "Activity" + 79 feature variables).

7. The tidy data set was written to a file called "TidyData.txt".