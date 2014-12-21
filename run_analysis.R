
run_analysis <- function() {
  ## This function does the following:
  ## 1) Reads the test and training data and merges into one data set.
  ## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## 3) Uses descriptive activity names to name the activities in the data set
  ## 4) Appropriately labels the data set with descriptive variable names. 
  ## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
  
  
  # 1) process the test set data
  
  # read the test subject data
  subject_test <- read.table("test/subject_test.txt",header=FALSE, sep = "",blank.lines.skip = TRUE,col.names=c("subject"))  

  # read the names of features 
  features <- read.table("features.txt",header=FALSE, sep = "",blank.lines.skip = TRUE)
  # remove the non-alphanumeric characters from the names column since 
  # we will be using these later as column names
  featuresNames <-gsub("\\W","",features$V2)

  # read the feature data for test subjects
  X_test <- read.table("test/X_test.txt",header=FALSE, sep = "",blank.lines.skip = TRUE,strip.white = TRUE,fill = TRUE,col.names=featuresNames)
  
  # read the test activity data
  y_test <- read.table("test/y_test.txt",header=FALSE, sep = "",blank.lines.skip = TRUE,col.names=c("activity"))
  
  # combine the test subject, activity and feature values
  test_data <- cbind(subject_test,y_test,X_test)  
    
  #process the training set data
  subject_train <- read.table("train/subject_train.txt",header=FALSE, sep = "",blank.lines.skip = TRUE,col.names=c("subject"))

  # read the feature data for training subjects
  X_train <- read.table("train/X_train.txt",header=FALSE, sep = "",blank.lines.skip = TRUE,strip.white = TRUE,fill = TRUE,col.names=featuresNames)
  
  # read the training activity data
  y_train <- read.table("train/y_train.txt",header=FALSE, sep = "",blank.lines.skip = TRUE,col.names=c("activity"))
 
  # combine the training subject, activity and feature values  
  train_data<-cbind(subject_train,y_train,X_train)
  
  # Combine the test and training data set needed for step 1
  testAndTrainData <- rbind(test_data,train_data)
  
  # 2)

  # combine the measurements from test and training sets
  measurements <- rbind(X_test,X_train)
  
  # extract the measurements that correspond to a standard deviation or mean values
  step2DataSet <- cbind(testAndTrainData[,1:2], measurements[,grepl("mean|std",featuresNames,ignore.case=TRUE)])
  
  # 3)  
  
  # read the activity names from the file and modify the activity column in the combined data 
  # set to reflect that 
  activityLabels <- read.table("activity_labels.txt",header=FALSE, sep = "",blank.lines.skip = TRUE,col.names=c("activity","activityName"))

  joinedSet <- join(step2DataSet,activityLabels)

  # since join appends the activityLabels as the last column, we need to reorder columns
  # and replace the activity column values with the label values
  step3DataSet <- cbind(joinedSet[,1],joinedSet[,89],joinedSet[,3:88])
  
  # due to the cbind and reordering of columns above, we need to rename the column again 
  colnames(step3DataSet)[2] <- "activity"
  
  # 4)
  # All the column names are descriptive at this point so no specific actions need 
  # to be taken for this step. Created a new dataset in this step to avoid confusion
  # in subsequent steps
  
  step4DataSet <- step3DataSet
  
  # 5)
  
  # we will have to reshape the data in order to do step 5
  meltSet <- melt(step4DataSet,id.vars=c("subject","activity"))
  
  # calculate the mean of the variables by subject and activity
  step5DataSet <- dcast(meltSet,subject + activity ~ variable,mean)
  
  # write out the final tidy dataset
  write.table(step5DataSet,"step5TidySet.txt",row.name=FALSE)
  
  return (step5DataSet)
  
}
