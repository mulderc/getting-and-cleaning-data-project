#script for "getting and cleaning data" course on cousera

# 0. download and unzip data into working dirctory

URL      <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
DataFile <- "UCIHARDataset.zip"
download.file(URL, DataFile)
unzip(DataFile)

# 1. Merges the training and the test sets to create one data set.

# 1.1 read in activcity labels and "features"

activity_labels = read.table("UCI HAR Dataset/activity_labels.txt",
                             header=FALSE, 
                             col.names = c("ActivityLevels","ActivityLabels"))
features        = read.table("UCI HAR Dataset/features.txt",
                             header=FALSE)

# 1.2 read in training and test data and apply column names
subject_train   = read.table("UCI HAR Dataset/train/subject_train.txt",
                             header=FALSE, 
                             col.names = "ParticipantID")
x_train         = read.table("UCI HAR Dataset/train/x_train.txt",
                             header=FALSE,)
names(x_train)  = features[,2]
y_train         = read.table("UCI HAR Dataset/train/y_train.txt",
                             header=FALSE, 
                             col.names = "Activity")
data_train      = cbind(subject_train,x_train,y_train)
subject_test    = read.table("UCI HAR Dataset/test/subject_test.txt",
                             header=FALSE, 
                             col.names = "ParticipantID")
x_test          = read.table("UCI HAR Dataset/test/x_test.txt",
                             header=FALSE)
names(x_test)   = features[,2]
y_test          = read.table("UCI HAR Dataset/test/y_test.txt",
                             header=FALSE, 
                             col.names = "Activity")
data_test       = cbind(subject_test,x_test,y_test)

# 1.3 merge testing and training data
data_merged = rbind(data_train,data_test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 2.1 Get names for the columns
ColumnNames = names(data_merged)

# 2.2 Make a TRUE/FALSE vector for the Activity, ParticipantID, mean, and std columns
ColumnsToKeep = (grepl("Activity"      ,ColumnNames) | 
                 grepl("ParticipantID" ,ColumnNames) | 
                 grepl("mean"          ,ColumnNames) | 
                 grepl("std"           ,ColumnNames) )

# 2.3 Subset data frame based on ColumnsToKeep to keep only necessary columns
Data = data_merged[ColumnsToKeep == TRUE]

# 3. Use descriptive activity names to name the activities in the data set
# 3.1 eplace activity values with activity labels as factors
Data$Activity <- factor(Data$Activity, 
                        levels = activity_labels$ActivityLevels, 
                        labels = activity_labels$ActivityLabels)

# Upaate of ColumnNames so we can use gsub to make better names
ColumnNames  = names(Data) 

# 4.Appropriately label the data set with descriptive activity names. 

ColumnNames <- gsub("[[:punct:]]" ,""                  ,ColumnNames)
ColumnNames <- gsub("^t"          ,"TimeDomain"        ,ColumnNames)
ColumnNames <- gsub("^f"          ,"FrequencyDomain"   ,ColumnNames)
ColumnNames <- gsub("Acc"         ,"Accelerometer"     ,ColumnNames)
ColumnNames <- gsub("Gyro"        ,"Gyroscope"         ,ColumnNames)
ColumnNames <- gsub("Mag"         ,"Magnitude"         ,ColumnNames)
ColumnNames <- gsub("Freq"        ,"Frequency"         ,ColumnNames)
ColumnNames <- gsub("std"         ,"StandardDeviation" ,ColumnNames)

# 4.1 Reassigning the new descriptive column names to the Data set
names(Data) = ColumnNames

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
# 5.1 installing Tidyverse package for this step
install.packages("tidyverse")
library(tidyverse)

# 5.2 New data frame in tidy data format,
IndependentTidyDataSet <- Data %>% 
  group_by(ParticipantID, Activity) %>%
  summarise_all(list(mean))


# 5.3 output "DataTidy.txt"
write.table(IndependentTidyDataSet, 
              file = "IndependentTidyDataSet.txt", 
              row.names = FALSE, 
              quote     = FALSE)
