## README.md

### How the run_analysis.R script works

The code in run_analysis.R can be run from any directory. The script takes a single optional argument, which is the path to the directory containing the relevant files and directories containing the original study data (i.e. the path to a folder containing the following:
 ./train/X_train.txt
 ./train/subject_train.txt
 ./train/y_train.txt
 ./test/X_test.txt
 ./test/subject_test.txt
 ./test/y_test.txt
 ./features.txt
 ./activity_labels.txt)
If no argument is passed, it will assume the script is being run from the same directory containing the above files and directories.  

The original study data is then read in using the read.table() function in R, using default parameter settings.

Next training and testing data are merged into the same tables. Subject, activity, and features are then merged together into a single table.

Columns are then labeled with appropriate names, with feature names taken from the features.txt file.

Features not containing "mean" or "std" in their feature name are discarded.

Next, activities, coded 1 through 6, are replaced with descriptive names, taken from the activity_labels.txt file.

A new tidy data set is created by using the melt() R function, with "Subject" and "Activity" as id fields. Using the dcast() R function to calculate the mean of the features by "Subject" and "Activity", a final data table is created, consisting of 180 rows (6 activities x 30 subjects) and 81 columns ("Subject" + "Activity" + 79 feature variables).

The tidy data set is written to a file called "TidyData.txt" in the current working directory (containing the original study data).

Finally, the script changes the working directory back to the original directory from which the script was called.

See the CodeBook.md file for a description of the variables and various transformations applied to the raw data to arrive at the final result.

### Files available in this repository

1. run_analysis.R - code that processes data from the original study, described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#, and produces TidyData.txt

2. TidyData.txt - final tidy data set

3. CodeBook.md - description of original study, original data, and processed data

4. README.md - description of how run_analysis.R works