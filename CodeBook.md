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
4. Source and run the run_analysis.r script (returns a tidy data frame). The run_analysis.R script performs the following tasks, in order:
    + Reads all needed input data using read.table()
    + Appends each of the "train" data sets to the related "test" data sets using rbind():
    + Joins the descriptive Activity.Type values to the test labels using left_join()
    + Finds the variables related to mean() and std() in the combined X data set and creates a logical vector mask using grepl() and regular expressions on Feature.Type
    + Combines the subject, activity, and variable data frames into one single data frame using cbind(). This combined data frame is called "all_data". **While this data frame, all_data, is only an intermediate data set in this analysis, it has been included in the repo for completeness as "all_data.csv"**
    + Converts "all_data" to long format by using melt() to melt on Subject.ID and Activity.Type
    + Groups the melted data by Subject.ID, Activity.Type, and variable using group_by()
    + Calculates the average value of each group using summarize() on the melted data
    + Renames the values in the variable column of the summarized melted data by adding "AVG." to the beginning of each value using paste0()
    + Converts the summarized melted data back into wide format using dcast()
    + Returns the tidy, summarized, wide-format data set as a data frame object
5. The returned data set can then be written to file using write.csv().

