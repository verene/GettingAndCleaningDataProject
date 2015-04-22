# run_analysis.R by Verene Martin, April 2015
# This function assumes zipped data file we'll be working with has already been
#  downloaded and unzipped.
# This function takes as an argument the directory containing the data folders
#  and metadata files. The default is the current working directory.

run_analysis <- function(workingdir="."){
  currentdir<-getwd()
  if(currentdir!=workingdir){
    setwd(workingdir)
  }
  
  # Read study data
  xtrain<-read.table("./train/X_train.txt")
  subjtrain<-read.table("./train/subject_train.txt")
  ytrain<-read.table("./train/y_train.txt")
  xtest<-read.table("./test/X_test.txt")
  subjtest<-read.table("./test/subject_test.txt")
  ytest<-read.table("./test/y_test.txt")
  
  #Read feature (variable) names
  featurenames<-read.table("features.txt")
  
  # Read activity labels
  activityLabels<-read.table("activity_labels.txt")
  
  #1. MERGE TRAINING AND TEST DATA SETS TO CREATE ONE DATA SET
  # First put training and test data for x, subject, and y separately into one table
  allx<-rbind(xtrain,xtest)
  allsub<-rbind(subjtrain,subjtest)
  ally<-rbind(ytrain,ytest)  
  # Then put all three data tables into one table
  alldata<-cbind(allsub,ally,allx)
  
  #4. APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
  # Note: this is out of order, but it's more efficient to do this step here
  names(alldata)<-c("Subject", "Activity", as.character(featurenames$V2))
  
  #2. EXTRACT MEASUREMENTS ON MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT
  # First get x column names that include strings "mean" or "std"
  colsToKeep<-grepl("mean",names(alldata))|grepl("std",names(alldata))
  # Keep first and second columns too, containing Subject and Activity
  colsToKeep[1:2]=TRUE
  # Extract only these columns from alldata table
  alldata<-alldata[,colsToKeep]
  
  #3. USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
  # Make a new table with Activity Code (number) in single row, with description (character string) as variable name
  LabelLookup<-activityLabels[,1]
  names(LabelLookup)<-activityLabels[,2]
  
  # Replace activity codes in alldata table with activity description, according to lookup table (LabelLookup)
  alldata$Activity<-names(LabelLookup)[match(alldata$Activity,LabelLookup)]
  
  #5. CREATE A SECOND INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND SUBJECT
  xCols<-colsToKeep[3:length(colsToKeep)]
  xColNames<-as.character(featurenames$V2[xCols])
  dataMelt<-melt(alldata,id=c("Activity","Subject"),measure.vars=xColNames)
  tidyData<-dcast(dataMelt,Activity+Subject~variable,mean)

  # Write data to file
  write.table(tidyData, file="TidyData.txt", row.names=FALSE)
  # Note: to read in this file in, use: read.table("TidyData.txt", header=TRUE)
  
  setwd(currentdir)
}