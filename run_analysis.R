run_analysis <- function (){
  #Load packages: dplyr, reshape2
  library(dplyr)
  library(reshape2)
  
  #Read in labels
  features <- read.table("./UCI HAR Dataset/features.txt",sep="",col.names=c("Feature.ID","Feature.Type"))
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",sep="",col.names=c("Activity.ID","Activity.Type"))
  
  #Read test data set
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",sep="",col.names=features$Feature.Type,check.names=FALSE)
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",sep="",col.names="Activity.ID")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",sep="",col.names="Subject.ID")
  #Read train data set
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",sep="",col.names=features$Feature.Type,check.names=FALSE)
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",sep="",col.names="Activity.ID")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="",col.names="Subject.ID")
  
  #Merge Data; Clean up workspace
  X <- rbind(X_test,X_train); rm(X_test,X_train)
  y <- rbind(y_test,y_train); rm(y_test,y_train)
  subject <- rbind(subject_test,subject_train); rm(subject_test,subject_train)
  
  #Join activity on Activity.ID
  y <- left_join(y,activity_labels,by=c("Activity.ID"="Activity.ID"));rm(activity_labels)
  
  #Only keep columns of X related with mean() and std()
  mask <- grepl("mean\\(\\)|std\\(\\)",features$Feature.Type)
  X <- X[,mask]
  
  #Combine into one, convert to tbl_df
  all_data <- tbl_df(cbind(subject,select(y,Activity.Type),X)); 
  rm(subject,y,X)
  
  #Group By Subject.ID and Activity.Type, and summarize with mean of each variable
  #Convert to Long format
  melted <- melt(all_data,id.vars=c("Subject.ID","Activity.Type"))
  melted <- group_by(melted,Subject.ID,Activity.Type,variable)
  melted <- summarize(melted,mean = mean(value))
  
  #paste AVG to the front of each variable name for more accurate description
  melted$variable <- paste0("AVG.",melted$variable) 
  
  #Return as data frame, in wide format
  recast <- dcast(melted,Subject.ID + Activity.Type ~ variable, value.var="mean")
  as.data.frame(recast)
}