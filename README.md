Getting And Cleaning Data Course Project
========================================

Files included in this repo
- README.md (current file)
- run_analysis.R
- Codebook (lists all the variables in the final dataset. Best viewed in 'raw' mode)

Important Assumptions:
- The data in the "inertial" folder was ignored because enough information wasn't provided on whether it was a standard deviation or a mean measurement. Also, there was hardly any explanation of what was different about each reading. 
- In the final tidy data set, the "activity" was replaced by the descriptive name. The name of the column could have been appended as an additional column but the instructions seemed to indicate that a replacement was necessary
- Though it wasnt mentioned, the final tidy dataset is written to a file within the fucntion run_analysis and the tidy dataset is returned at the end of the function
- The code has plenty of inline comments explaining how the final tidy dataset was created

