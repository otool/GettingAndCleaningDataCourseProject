#CodeBook.md

**The following steps were performed to obtain, clean, and manipulate data:**

1. Download the "Human Activity Recognition Using Smartphones Data Set" from the following location:
    + https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Place the extracted folder in the working directory so that the following file paths will be accessible by the run_analysis.R script:
    + "./UCI HAR Dataset/features.txt"
    + "./UCI HAR Dataset/activity_labels.txt"
    + "./UCI HAR Dataset/test/X_test.txt"
    + "./UCI HAR Dataset/test/y_test.txt"
    + "./UCI HAR Dataset/test/subject_test.txt"
    + "./UCI HAR Dataset/train/X_train.txt"
    + "./UCI HAR Dataset/train/y_train.txt"
    + "./UCI HAR Dataset/train/subject_train.txt"
3. Load the following to R packages, which are used by the run_analysis.R script:
    + dplyr
    + reshape2
4. Source and run the `run_analysis.r` script (returns a tidy data frame). The `run_analysis.R` script performs the following tasks, in order:
    + Reads all needed input data using read.table()
    + Appends each of the "train" data sets to the related "test" data sets using rbind():
    + Joins the descriptive Activity.Type values to the test labels using left_join()
    + Finds the variables related to mean() and std() in the combined X data set and creates a logical vector mask using grepl() and regular expressions on Feature.Type
    + Combines the subject, activity, and variable data frames into one single data frame using cbind(). This combined data frame is called "all_data". While this data frame, all_data, is only an intermediate data set in this analysis, it has been included in the repo for completeness as `all_data.csv`
    + Converts "all_data" to long format by using melt() to melt on Subject.ID and Activity.Type
    + Groups the melted data by `Subject.ID`, `Activity.Type`, and variable using group_by()
    + Calculates the average value of each group using summarize() on the melted data
    + Renames the values in the variable column of the summarized melted data by adding "AVG." to the beginning of each value using paste0()
    + Converts the summarized melted data back into wide format using dcast()
    + Returns the tidy, summarized, wide-format data set as a data frame object
5. The returned data set can then be written to file using write.csv() or write.table(), using row.names=FALSE. See `tidy_HAR.csv`

The data frame output by `run_analysis.R` contains the following variables:

1. `Subject.ID` : Unique subject ID, from 1 to 30
2. `Activity.Type` : Descriptive activity type (6 unique values)
3. `AVG.fBodyAcc-mean()-X` : Average of all `fBodyAcc-mean()-X` observations for a specific Subject.ID and Activity.Type.
4. `AVG.fBodyAcc-mean()-Y` : Average of all `fBodyAcc-mean()-Y` observations for a specific Subject.ID and Activity.Type.
5. `AVG.fBodyAcc-mean()-Z` : Average of all `fBodyAcc-mean()-Z` observations for a specific Subject.ID and Activity.Type.
6. `AVG.fBodyAcc-std()-X` : Average of all `fBodyAcc-std()-X` observations for a specific Subject.ID and Activity.Type.
7. `AVG.fBodyAcc-std()-Y` : Average of all `fBodyAcc-std()-Y` observations for a specific Subject.ID and Activity.Type.
8. `AVG.fBodyAcc-std()-Z` : Average of all `fBodyAcc-std()-Z` observations for a specific Subject.ID and Activity.Type.
9. `AVG.fBodyAccJerk-mean()-X` : Average of all `fBodyAccJerk-mean()-X` observations for a specific Subject.ID and Activity.Type.
10. `AVG.fBodyAccJerk-mean()-Y` : Average of all `fBodyAccJerk-mean()-Y` observations for a specific Subject.ID and Activity.Type.
11. `AVG.fBodyAccJerk-mean()-Z` : Average of all `fBodyAccJerk-mean()-Z` observations for a specific Subject.ID and Activity.Type.
12. `AVG.fBodyAccJerk-std()-X` : Average of all `fBodyAccJerk-std()-X` observations for a specific Subject.ID and Activity.Type.
13. `AVG.fBodyAccJerk-std()-Y` : Average of all `fBodyAccJerk-std()-Y` observations for a specific Subject.ID and Activity.Type.
14. `AVG.fBodyAccJerk-std()-Z` : Average of all `fBodyAccJerk-std()-Z` observations for a specific Subject.ID and Activity.Type.
15. `AVG.fBodyAccMag-mean()` : Average of all `fBodyAccMag-mean()` observations for a specific Subject.ID and Activity.Type.
16. `AVG.fBodyAccMag-std()` : Average of all `fBodyAccMag-std()` observations for a specific Subject.ID and Activity.Type.
17. `AVG.fBodyBodyAccJerkMag-mean()` : Average of all `fBodyBodyAccJerkMag-mean()` observations for a specific Subject.ID and Activity.Type.
18. `AVG.fBodyBodyAccJerkMag-std()` : Average of all `fBodyBodyAccJerkMag-std()` observations for a specific Subject.ID and Activity.Type.
19. `AVG.fBodyBodyGyroJerkMag-mean()` : Average of all `fBodyBodyGyroJerkMag-mean()` observations for a specific Subject.ID and Activity.Type.
20. `AVG.fBodyBodyGyroJerkMag-std()` : Average of all `fBodyBodyGyroJerkMag-std()` observations for a specific Subject.ID and Activity.Type.
21. `AVG.fBodyBodyGyroMag-mean()` : Average of all `fBodyBodyGyroMag-mean()` observations for a specific Subject.ID and Activity.Type.
22. `AVG.fBodyBodyGyroMag-std()` : Average of all `fBodyBodyGyroMag-std()` observations for a specific Subject.ID and Activity.Type.
23. `AVG.fBodyGyro-mean()-X` : Average of all `fBodyGyro-mean()-X` observations for a specific Subject.ID and Activity.Type.
24. `AVG.fBodyGyro-mean()-Y` : Average of all `fBodyGyro-mean()-Y` observations for a specific Subject.ID and Activity.Type.
25. `AVG.fBodyGyro-mean()-Z` : Average of all `fBodyGyro-mean()-Z` observations for a specific Subject.ID and Activity.Type.
26. `AVG.fBodyGyro-std()-X` : Average of all `fBodyGyro-std()-X` observations for a specific Subject.ID and Activity.Type.
27. `AVG.fBodyGyro-std()-Y` : Average of all `fBodyGyro-std()-Y` observations for a specific Subject.ID and Activity.Type.
28. `AVG.fBodyGyro-std()-Z` : Average of all `fBodyGyro-std()-Z` observations for a specific Subject.ID and Activity.Type.
29. `AVG.tBodyAcc-mean()-X` : Average of all `tBodyAcc-mean()-X` observations for a specific Subject.ID and Activity.Type.
30. `AVG.tBodyAcc-mean()-Y` : Average of all `tBodyAcc-mean()-Y` observations for a specific Subject.ID and Activity.Type.
31. `AVG.tBodyAcc-mean()-Z` : Average of all `tBodyAcc-mean()-Z` observations for a specific Subject.ID and Activity.Type.
32. `AVG.tBodyAcc-std()-X` : Average of all `tBodyAcc-std()-X` observations for a specific Subject.ID and Activity.Type.
33. `AVG.tBodyAcc-std()-Y` : Average of all `tBodyAcc-std()-Y` observations for a specific Subject.ID and Activity.Type.
34. `AVG.tBodyAcc-std()-Z` : Average of all `tBodyAcc-std()-Z` observations for a specific Subject.ID and Activity.Type.
35. `AVG.tBodyAccJerk-mean()-X` : Average of all `tBodyAccJerk-mean()-X` observations for a specific Subject.ID and Activity.Type.
36. `AVG.tBodyAccJerk-mean()-Y` : Average of all `tBodyAccJerk-mean()-Y` observations for a specific Subject.ID and Activity.Type.
37. `AVG.tBodyAccJerk-mean()-Z` : Average of all `tBodyAccJerk-mean()-Z` observations for a specific Subject.ID and Activity.Type.
38. `AVG.tBodyAccJerk-std()-X` : Average of all `tBodyAccJerk-std()-X` observations for a specific Subject.ID and Activity.Type.
39. `AVG.tBodyAccJerk-std()-Y` : Average of all `tBodyAccJerk-std()-Y` observations for a specific Subject.ID and Activity.Type.
40. `AVG.tBodyAccJerk-std()-Z` : Average of all `tBodyAccJerk-std()-Z` observations for a specific Subject.ID and Activity.Type.
41. `AVG.tBodyAccJerkMag-mean()` : Average of all `tBodyAccJerkMag-mean()` observations for a specific Subject.ID and Activity.Type.
42. `AVG.tBodyAccJerkMag-std()` : Average of all `tBodyAccJerkMag-std()` observations for a specific Subject.ID and Activity.Type.
43. `AVG.tBodyAccMag-mean()` : Average of all `tBodyAccMag-mean()` observations for a specific Subject.ID and Activity.Type.
44. `AVG.tBodyAccMag-std()` : Average of all `tBodyAccMag-std()` observations for a specific Subject.ID and Activity.Type.
45. `AVG.tBodyGyro-mean()-X` : Average of all `tBodyGyro-mean()-X` observations for a specific Subject.ID and Activity.Type.
46. `AVG.tBodyGyro-mean()-Y` : Average of all `tBodyGyro-mean()-Y` observations for a specific Subject.ID and Activity.Type.
47. `AVG.tBodyGyro-mean()-Z` : Average of all `tBodyGyro-mean()-Z` observations for a specific Subject.ID and Activity.Type.
48. `AVG.tBodyGyro-std()-X` : Average of all `tBodyGyro-std()-X` observations for a specific Subject.ID and Activity.Type.
49. `AVG.tBodyGyro-std()-Y` : Average of all `tBodyGyro-std()-Y` observations for a specific Subject.ID and Activity.Type.
50. `AVG.tBodyGyro-std()-Z` : Average of all `tBodyGyro-std()-Z` observations for a specific Subject.ID and Activity.Type.
51. `AVG.tBodyGyroJerk-mean()-X` : Average of all `tBodyGyroJerk-mean()-X` observations for a specific Subject.ID and Activity.Type.
52. `AVG.tBodyGyroJerk-mean()-Y` : Average of all `tBodyGyroJerk-mean()-Y` observations for a specific Subject.ID and Activity.Type.
53. `AVG.tBodyGyroJerk-mean()-Z` : Average of all `tBodyGyroJerk-mean()-Z` observations for a specific Subject.ID and Activity.Type.
54. `AVG.tBodyGyroJerk-std()-X` : Average of all `tBodyGyroJerk-std()-X` observations for a specific Subject.ID and Activity.Type.
55. `AVG.tBodyGyroJerk-std()-Y` : Average of all `tBodyGyroJerk-std()-Y` observations for a specific Subject.ID and Activity.Type.
56. `AVG.tBodyGyroJerk-std()-Z` : Average of all `tBodyGyroJerk-std()-Z` observations for a specific Subject.ID and Activity.Type.
57. `AVG.tBodyGyroJerkMag-mean()` : Average of all `tBodyGyroJerkMag-mean()` observations for a specific Subject.ID and Activity.Type.
58. `AVG.tBodyGyroJerkMag-std()` : Average of all `tBodyGyroJerkMag-std()` observations for a specific Subject.ID and Activity.Type.
59. `AVG.tBodyGyroMag-mean()` : Average of all `tBodyGyroMag-mean()` observations for a specific Subject.ID and Activity.Type.
60. `AVG.tBodyGyroMag-std()` : Average of all `tBodyGyroMag-std()` observations for a specific Subject.ID and Activity.Type.
61. `AVG.tGravityAcc-mean()-X` : Average of all `tGravityAcc-mean()-X` observations for a specific Subject.ID and Activity.Type.
62. `AVG.tGravityAcc-mean()-Y` : Average of all `tGravityAcc-mean()-Y` observations for a specific Subject.ID and Activity.Type.
63. `AVG.tGravityAcc-mean()-Z` : Average of all `tGravityAcc-mean()-Z` observations for a specific Subject.ID and Activity.Type.
64. `AVG.tGravityAcc-std()-X` : Average of all `tGravityAcc-std()-X` observations for a specific Subject.ID and Activity.Type.
65. `AVG.tGravityAcc-std()-Y` : Average of all `tGravityAcc-std()-Y` observations for a specific Subject.ID and Activity.Type.
66. `AVG.tGravityAcc-std()-Z` : Average of all `tGravityAcc-std()-Z` observations for a specific Subject.ID and Activity.Type.
67. `AVG.tGravityAccMag-mean()` : Average of all `tGravityAccMag-mean()` observations for a specific Subject.ID and Activity.Type.
68. `AVG.tGravityAccMag-std()` : Average of all `tGravityAccMag-std()` observations for a specific Subject.ID and Activity.Type.

