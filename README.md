## Getting And Cleaning Data Course Project
## ========================================

** Files included in this Repo:** 
- **README.md** (current file)
- **run_analysis.R**: documented source code of the function that produces and returns the tidy dataset
- **CodeBook.md**: this file lists all the variables in the final dataset. For some reason, the contents of the file get 'wrapped' Please view the file in 'raw' mode.

** Files used by the script:** 
* test folder
-test/subject_test.txt = test subject ids 
-test/X_test.txt = measurements
-test/y_test.txt = activities during which measurements were made
* train folder
- train/subject_train.txt = training subject ids
- train/X_train.txt = measurements
- train/y_train.txt = activities during which measurements were made
* features.txt = descriptions of the variables in dataset
* activity_labels.txt = descriptive labels for the activities

** Process: **
* The train and test data sets (and folders) were copied to the same working directory as the working assignment. 
* The main script run_analysis.R has a function where the following steps take place:
- Reads the test and training data and merges into one data set
- Extract only the measurements on the mean and standard deviation for each measurement. Assumption: Any variable with 'std' or 'mean' in its name was assumed to be a standard deviation or mean measurement
- Uses descriptive activity names to name the activities in the data set. The activity names were obtained from the activity_labels.txt file
- Appropriately labels the data set with descriptive variable names. _The variable names were created after removing the alphanumeric characters from the measurement names in features.txt_. They seemed descriptive enough for the purposes of this project
- From the data set in step 4, a second independent tidy data set with the average of each variable for each activity and each subject was created.  

** Please Note:**
- **The data in the "inertial" folder was ignored ** because enough information wasn't provided on whether it was a standard deviation or a mean measurement. Also, there was hardly any explanation of what was different about each reading. 
- In the final tidy data set, the "activity" was replaced by the descriptive name. Both the activity and activity name could have been maintained in two columns but then it would have violated the tidy data requirement
- Though it wasnt mentioned, the final tidy dataset is written to a file within the function run_analysis and the tidy dataset is returned at the end of the function
- The code is well-documented with plenty of inline comments explaining what each step of the process does till the creation of the final tidy dataset
