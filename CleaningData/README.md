##Using run_analysis.R
1. Firstly, this script merges the _test_ and _train_ set data. 
2. Then it extracts  the measurements on the mean and standard deviation for each measurement. 
3. To make the column headers more readable, names from "feature.txt" file is used as the column names.
4. The script also replaces activity codes by more descriptive activity names as indicated in the "activity_labels.txt"
5. Finally, the script creaetes a tidy data set with the average of each variable for each activity and each subject and writes to "tidydata.txt file.


 