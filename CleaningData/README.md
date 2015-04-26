##Using run_analysis.R
1. Firstly, this script merges the _test_ and _train_ data sets. 
2. Then it extracts  the measurements on the mean and standard deviation for each measurement from the raw df. 
3. To make the column headers more readable, the names from "feature.txt" file is used as the column names.
4. The script also replaces activity codes by the  descriptive activity names as indicated in the "activity_labels.txt"
5. Finally, the script creates a tidy data set with the average of each variable for each activity and each subject and writes to "tidydata.txt file.


 