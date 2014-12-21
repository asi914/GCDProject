Getting And Cleaning Data Course Project
========================================

Files included in this repo
- README.md (current file)
- run_analysis.R: documented source code of the function that produces and returns the tidy dataset
- Codebook: this file lists all the variables in the final dataset. For some reason, the contents of the file get 'wrapped' Please view the file in 'raw' mode.

Files accessed by the script:


Process:
* The train and test data sets (and folders) were copied to the same working directory as the working assignment. The run_analysis function does the following:
* Reads the test and training data and merges into one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
      ** Assumption: Any variable with 'std' or 'mean' in its name was assumed to be a standard deviation or mean measurement
      - Uses descriptive activity names to name the activities in the data set
      - the activity names were obtained from the activity_labels.txt file
      - Appropriately labels the data set with descriptive variable names. 
      - the variable names were created after removing the alphanumeric characters from the measurement names. They
      seemed description enough for the purposes of this dataset
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

Important Assumptions:
- The data in the "inertial" folder was ignored because enough information wasn't provided on whether it was a standard deviation or a mean measurement. Also, there was hardly any explanation of what was different about each reading. 
- In the final tidy data set, the "activity" was replaced by the descriptive name. The name of the column could have been appended as an additional column but the instructions seemed to indicate that a replacement was necessary
- Though it wasnt mentioned, the final tidy dataset is written to a file within the function run_analysis and the tidy dataset is returned at the end of the function
- The code has plenty of inline comments explaining how the final tidy dataset was created
